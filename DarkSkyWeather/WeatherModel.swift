//
//  WeatherSummary.swift
//  DarkSkyWeather
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import Foundation

// The following fields are specified in JSON data from the DarkSky API
struct DarkSkyJsonResponse: Codable{
    var daily: dailyArray
}

struct dailyArray: Codable{
    var data: [dailySummary]
}

struct dailySummary: Codable {
    var time: Int
    var summary: String
    var temperatureHigh: Double
    var temperatureLow: Double
    var precipProbability: Double
    var precipType: String
    var icon: String
    var sunriseTime: Int
    var sunsetTime: Int
    var humidity: Double
    var pressure: Double
    var windSpeed: Double
    var windBearing: Double
    var windGust: Double
    var visibility: Double
    var uvIndex: Double
    
    static var hourFormatter: DateFormatter? = nil
    var sunCastFormatter: DateFormatter = { () -> DateFormatter in
        if (hourFormatter == nil) {
            hourFormatter = DateFormatter()
            hourFormatter?.locale = Locale(identifier: "US_en")
            hourFormatter?.timeStyle = .none
            hourFormatter?.dateFormat = "hh:mm a"
        }
        return hourFormatter!
    }()
    
    static var dayFormatter: DateFormatter? = nil
    var weekDayFormatter: DateFormatter = { () -> DateFormatter in
        if (dayFormatter == nil) {
            dayFormatter = DateFormatter()
            dayFormatter?.locale = Locale(identifier: "US_en")
            dayFormatter?.timeStyle = .none
            dayFormatter?.dateFormat = "EEEE, MMM d"
        }
        return dayFormatter!
    }()
}

extension dailySummary {
    enum CodingKeys: String, CodingKey{
        case time = "time"
        case summary = "summary"
        case temperatureHigh = "temperatureHigh"
        case temperatureLow = "temperatureLow"
        case precipProbability = "precipProbability"
        case precipType = "precipType"
        case icon = "icon"
        case sunriseTime = "sunriseTime"
        case sunsetTime = "sunsetTime"
        case humidity = "humidity"
        case pressure = "pressure"
        case windSpeed = "windSpeed"
        case windBearing = "windBearing"
        case windGust = "windGust"
        case visibility = "visibility"
        case uvIndex = "uvIndex"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.time = try container.decode(Int.self, forKey: .time)
        self.summary = try container.decode(String.self, forKey:.summary)
        self.temperatureHigh = try container.decode(Double.self, forKey:.temperatureHigh)
        self.temperatureLow = try container.decode(Double.self, forKey:.temperatureLow)
        self.precipProbability = try container.decode(Double.self, forKey:.precipProbability)
        self.precipType = try (container.decodeIfPresent(String.self, forKey: .precipType) ?? "precipitations")!
        self.icon = try container.decode(String.self, forKey:.icon)
        self.sunriseTime = try container.decode(Int.self, forKey:.sunriseTime)
        self.sunsetTime = try container.decode(Int.self, forKey:.sunsetTime)
        self.humidity = try container.decode(Double.self, forKey:.humidity)
        self.pressure = try container.decode(Double.self, forKey:.pressure)
        self.windSpeed = try container.decode(Double.self, forKey:.windSpeed)
        self.windBearing = try container.decode(Double.self, forKey:.windBearing)
        self.windGust = try container.decode(Double.self, forKey:.windGust)
        self.visibility = try container.decode(Double.self, forKey:.visibility)
        self.uvIndex = try container.decode(Double.self, forKey:.uvIndex)
    }
    
    subscript(key: String) -> String {
        let m = Mirror(reflecting: self)
        switch (m.children.first { $0.label == key }?.value) {
            case let someInt as Int:
                switch key {
                    case let timeKey where timeKey == "sunriseTime" || timeKey == "sunsetTime":
                        return (dailySummary.hourFormatter?.string(from:  Date(timeIntervalSince1970:TimeInterval(someInt))))!
                    default:
                        return (String(someInt))
            }
            case let someDouble as Double:
                switch key {
                    case let precipKey where precipKey == "precipProbability" || precipKey == "humidity":
                        return ("\(someDouble)%" )
                    case let windKey where windKey == "windSpeed":
                        return ("\(degToCompass(bearing:self.windBearing)) \(String(format:"%0.1f",someDouble)) mph")
                    case let windGustKey where windGustKey == "windGust":
                        return ("\(String(format:"%0.1f",someDouble)) mph")
                    case let pressureKey where pressureKey == "pressure":
                        return ("\(String(format:"%0.1f",someDouble)) inHg" )
                    case let visibilityKey where visibilityKey == "visibility":
                        return ("\(someDouble) mi" )
                    case let windBearingKey where windBearingKey == "windBearing":
                        return ("\(degToCompass(bearing:someDouble))" )
                   default:
                        return (String(someDouble))
            }
            case let someString as String:
                return (someString)
            default:
                return " "
        }
    }
    
    func degToCompass( bearing : Double) ->String{
        let dirArr = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
        let val = Int(bearing/22.5 + 0.5)
        return dirArr[val]
    }
}

//[ (("SUNRISE","sunriseTime"),("SUNSET","sunsetTime")), (("CHANCE OF","precipProbability"),("HUMIDITY","humidity")), (("WIND","windSpeed"),("DIRECTION","degToCompass!")), (("VISIBILITY","visibility"),("PRESSURE","pressure"))]
