//
//  WeatherSummary.swift
//  ZachChallenge
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import Foundation

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
