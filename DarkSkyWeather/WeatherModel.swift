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
    var currently: currently
}

struct dailyArray: Codable{
    var data: [daily]
}

struct daily: Codable{
    var time: Int
    var summary: String
    var temperatureHigh: Double
    var temperatureLow: Double
    var precipProbability: Double
    var precipType: String?
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
}

extension daily {
    
    static var dayFormatter: DateFormatter? = nil
    static var hourFormatter: DateFormatter? = nil
    
    static var sunCastFormatter: DateFormatter {
        if (daily.hourFormatter == nil) {
            daily.hourFormatter = DateFormatter()
            daily.hourFormatter?.locale = Locale(identifier: "US_en")
            daily.hourFormatter?.timeStyle = .none
            daily.hourFormatter?.dateFormat = "hh:mm a"
        }
        return daily.hourFormatter!
    }
    
    var weekDayFormatter: DateFormatter {
        if (daily.dayFormatter == nil) {
            daily.dayFormatter = DateFormatter()
            daily.dayFormatter?.locale = Locale(identifier: "US_en")
            daily.dayFormatter?.timeStyle = .none
            daily.dayFormatter?.dateFormat = "EEEE, MMM d"
        }
        return daily.dayFormatter!
    }
    
    var weekDay: String {
        return weekDayFormatter.string(from: Date(timeIntervalSince1970:TimeInterval(time)))
    }
    
    subscript(key: String) -> String {
        let m = Mirror(reflecting: self)
        switch (m.children.first { $0.label == key }?.value) {
        case let someInt as Int:
            switch key {
            case let timeKey where timeKey == "sunriseTime" || timeKey == "sunsetTime":
                return (daily.sunCastFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(someInt))))
            default:
                return (String(someInt))
            }
        case let someDouble as Double:
            switch key {
            case let precipKey where precipKey == "precipProbability" || precipKey == "humidity":
                return ("\(String(format:"%0.1f",someDouble*100))%" )
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
        return dirArr[val < 16 ? val : 0]
    }
}


struct currently: Codable {
    var time: Int                           
    var summary: String
    var icon: String
    var nearestStormDistance: Double
    var precipIntensity: Double
    var precipProbability: Double
    var temperature: Double
    var apparentTemperature: Double
    var dewPoint: Double
    var humidity: Double
    var pressure: Double
    var windSpeed: Double
    var windGust: Double
    var windBearing: Double
    var cloudCover: Double
    var uvIndex: Double
    var visibility: Double
    var ozone: Double
}
extension currently{
    var wind: String {
        return String("\(windSpeed) \(degToCompass(bearing: windBearing))")
    }
    func degToCompass( bearing : Double) ->String{
        let dirArr = ["N","NNE","NE","ENE","E","ESE", "SE", "SSE","S","SSW","SW","WSW","W","WNW","NW","NNW"]
        let val = Int(bearing/22.5 + 0.5)
        return dirArr[val < 16 ? val : 0]
    }
}

//[ (("SUNRISE","sunriseTime"),("SUNSET","sunsetTime")), (("CHANCE OF","precipProbability"),("HUMIDITY","humidity")), (("WIND","windSpeed"),("DIRECTION","degToCompass!")), (("VISIBILITY","visibility"),("PRESSURE","pressure"))]
