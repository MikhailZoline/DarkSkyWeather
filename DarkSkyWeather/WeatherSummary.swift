//
//  WeatherSummary.swift
//  ZachChallenge
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import Foundation
/* Excerpt of data we recive from DarkSky API
 let json = """
 { "latitude": 37.8267,
 "longitude": -122.4233,
 "timezone": "America/Los_Angeles",
 "currently": {
 "time": 1543261599,
 "summary": "Mostly Cloudy",
 "icon": "partly-cloudy-day",
 "nearestStormDistance": 84,
 "nearestStormBearing": 318,
 "precipIntensity": 0,
 "precipProbability": 0,
 "temperature": 60.09,
 "apparentTemperature": 60.09,
 "dewPoint": 50.15,
 "humidity": 0.7,
 "pressure": 1021.73,
 "windSpeed": 2.45,
 "windGust": 7.06,
 "windBearing": 41,
 "cloudCover": 0.68,
 "uvIndex": 2,
 "visibility": 10,
 "ozone": 263.93
 },
 "daily": {
 "summary": "Rain tomorrow through Saturday, with high temperatures falling to 55°F on Sunday.",
 "icon": "rain",
 "data": [
 {
 "time": 1543219200,
 "summary": "Partly cloudy throughout the day.",
 "icon": "partly-cloudy-night",
 "sunriseTime": 1543244604,
 "sunsetTime": 1543280029,
 "moonPhase": 0.63,
 "precipIntensity": 0.0002,
 "precipIntensityMax": 0.0017,
 "precipIntensityMaxTime": 1543291200,
 "precipProbability": 0.09,
 "precipType": "rain",
 "temperatureHigh": 62.51,
 "temperatureHighTime": 1543273200,
 "temperatureLow": 53.5,
 "temperatureLowTime": 1543327200,
 "apparentTemperatureHigh": 62.51,
 "apparentTemperatureHighTime": 1543273200,
 "apparentTemperatureLow": 53.5,
 "apparentTemperatureLowTime": 1543327200,
 "dewPoint": 49.07,
 "humidity": 0.75,
 "pressure": 1021.29,
 "windSpeed": 1.84,
 "windGust": 7.77,
 "windGustTime": 1543255200,
 "windBearing": 9,
 "cloudCover": 0.42,
 "uvIndex": 2,
 "uvIndexTime": 1543255200,
 "visibility": 10,
 "ozone": 266.2,
 "temperatureMin": 51.98,
 "temperatureMinTime": 1543244400,
 "temperatureMax": 62.51,
 "temperatureMaxTime": 1543273200,
 "apparentTemperatureMin": 51.98,
 "apparentTemperatureMinTime": 1543244400,
 "apparentTemperatureMax": 62.51,
 "apparentTemperatureMaxTime": 1543273200
 },
 {
 "time": 1543305600,
 "summary": "Rain in the afternoon.",
 "icon": "rain",
 "sunriseTime": 1543331064,
 "sunsetTime": 1543366409,
 "moonPhase": 0.67,
 "precipIntensity": 0.0137,
 "precipIntensityMax": 0.0764,
 "precipIntensityMaxTime": 1543352400,
 "precipProbability": 0.76,
 "precipType": "rain",
 "temperatureHigh": 59.84,
 "temperatureHighTime": 1543374000,
 "temperatureLow": 56.66,
 "temperatureLowTime": 1543417200,
 "apparentTemperatureHigh": 59.88,
 "apparentTemperatureHighTime": 1543374000,
 "apparentTemperatureLow": 56.66,
 "apparentTemperatureLowTime": 1543417200,
 "dewPoint": 54.48,
 "humidity": 0.93,
 "pressure": 1018.05,
 "windSpeed": 6.78,
 "windGust": 20.68,
 "windGustTime": 1543352400,
 "windBearing": 196,
 "cloudCover": 0.88,
 "uvIndex": 2,
 "uvIndexTime": 1543345200,
 "visibility": 8.94,
 "ozone": 263.84,
 "temperatureMin": 53.5,
 "temperatureMinTime": 1543327200,
 "temperatureMax": 59.9,
 "temperatureMaxTime": 1543377600,
 "apparentTemperatureMin": 53.5,
 "apparentTemperatureMinTime": 1543327200,
 "apparentTemperatureMax": 59.95,
 "apparentTemperatureMaxTime": 1543377600
 }
 ]
 },
 "flags": {
 "sources": [
 "nearest-precip",
 "nwspa",
 "cmc",
 "gfs",
 "hrrr",
 "icon",
 "isd",
 "madis",
 "nam",
 "sref",
 "darksky"
 ],
 "nearest-station": 1.839,
 "units": "us"
 },
 "offset": -8
 }
 """.data(using: .utf8)!
 */
// The following fields are specified in JSON data from the DarkSky API
struct mainJson: Codable{
    var daily: dailyArray
}

struct dailyArray: Codable{
    var data: [dailySummary]
}

struct dailySummary: Codable{
    var  time: Int
    var  summary: String
    var  temperatureHigh: Double
    var  temperatureLow: Double
    var  icon: String
}
