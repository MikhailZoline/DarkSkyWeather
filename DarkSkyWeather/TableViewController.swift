//
//  TableViewController.swift
//  ZachChallenge
//
//  Created by Mikhail Zoline on 11/26/18.
//  Copyright © 2018 MZ. All rights reserved.
//

import UIKit
let json = """
{
  "latitude": 37.8267,
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
  "minutely": {
    "summary": "Mostly cloudy for the hour.",
    "icon": "partly-cloudy-day",
    "data": [
      {
        "time": 1543261560,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261620,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261680,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261740,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261800,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261860,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261920,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543261980,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262040,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262100,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262160,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262220,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262280,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262340,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262400,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262460,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262520,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262580,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262640,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262700,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262760,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262820,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262880,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543262940,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263000,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263060,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263120,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263180,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263240,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263300,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263360,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263420,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263480,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263540,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263600,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263660,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263720,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263780,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263840,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263900,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543263960,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264020,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264080,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264140,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264200,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264260,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264320,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264380,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264440,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264500,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264560,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264620,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264680,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264740,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264800,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264860,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264920,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543264980,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543265040,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543265100,
        "precipIntensity": 0,
        "precipProbability": 0
      },
      {
        "time": 1543265160,
        "precipIntensity": 0,
        "precipProbability": 0
      }
    ]
  },
  "hourly": {
    "summary": "Mostly cloudy throughout the day.",
    "icon": "partly-cloudy-night",
    "data": [
      {
        "time": 1543258800,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-day",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 58.81,
        "apparentTemperature": 58.81,
        "dewPoint": 49.63,
        "humidity": 0.72,
        "pressure": 1022.37,
        "windSpeed": 2.23,
        "windGust": 7.67,
        "windBearing": 33,
        "cloudCover": 0.65,
        "uvIndex": 2,
        "visibility": 10,
        "ozone": 264.71
      },
      {
        "time": 1543262400,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-day",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 60.46,
        "apparentTemperature": 60.46,
        "dewPoint": 50.29,
        "humidity": 0.69,
        "pressure": 1021.54,
        "windSpeed": 2.53,
        "windGust": 6.89,
        "windBearing": 43,
        "cloudCover": 0.69,
        "uvIndex": 2,
        "visibility": 10,
        "ozone": 263.71
      },
      {
        "time": 1543266000,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-day",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 61.68,
        "apparentTemperature": 61.68,
        "dewPoint": 50.98,
        "humidity": 0.68,
        "pressure": 1021,
        "windSpeed": 3.25,
        "windGust": 6.17,
        "windBearing": 39,
        "cloudCover": 0.85,
        "uvIndex": 2,
        "visibility": 10,
        "ozone": 263.02
      },
      {
        "time": 1543269600,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-day",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 62.13,
        "apparentTemperature": 62.13,
        "dewPoint": 51.42,
        "humidity": 0.68,
        "pressure": 1020.72,
        "windSpeed": 3.75,
        "windGust": 6.23,
        "windBearing": 33,
        "cloudCover": 0.81,
        "uvIndex": 1,
        "visibility": 10,
        "ozone": 262.7
      },
      {
        "time": 1543273200,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-day",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 62.51,
        "apparentTemperature": 62.51,
        "dewPoint": 51.79,
        "humidity": 0.68,
        "pressure": 1020.6,
        "windSpeed": 3.51,
        "windGust": 5.55,
        "windBearing": 19,
        "cloudCover": 0.71,
        "uvIndex": 1,
        "visibility": 10,
        "ozone": 262.61
      },
      {
        "time": 1543276800,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-day",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 62.33,
        "apparentTemperature": 62.33,
        "dewPoint": 52.15,
        "humidity": 0.69,
        "pressure": 1020.58,
        "windSpeed": 2.83,
        "windGust": 4.84,
        "windBearing": 8,
        "cloudCover": 0.44,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 262.7
      },
      {
        "time": 1543280400,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0015,
        "precipProbability": 0.02,
        "precipType": "rain",
        "temperature": 61.41,
        "apparentTemperature": 61.41,
        "dewPoint": 52.33,
        "humidity": 0.72,
        "pressure": 1020.55,
        "windSpeed": 2.42,
        "windGust": 3.8,
        "windBearing": 6,
        "cloudCover": 0.52,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263
      },
      {
        "time": 1543284000,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 59.99,
        "apparentTemperature": 59.99,
        "dewPoint": 52.41,
        "humidity": 0.76,
        "pressure": 1020.47,
        "windSpeed": 1.59,
        "windGust": 2.66,
        "windBearing": 309,
        "cloudCover": 0.69,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263.34
      },
      {
        "time": 1543287600,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0003,
        "precipProbability": 0.03,
        "precipType": "rain",
        "temperature": 59.32,
        "apparentTemperature": 59.32,
        "dewPoint": 52.74,
        "humidity": 0.79,
        "pressure": 1020.38,
        "windSpeed": 2.88,
        "windGust": 4.03,
        "windBearing": 296,
        "cloudCover": 0.85,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263.65
      },
      {
        "time": 1543291200,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0017,
        "precipProbability": 0.04,
        "precipType": "rain",
        "temperature": 58.27,
        "apparentTemperature": 58.27,
        "dewPoint": 52.51,
        "humidity": 0.81,
        "pressure": 1020.58,
        "windSpeed": 3.52,
        "windGust": 4.91,
        "windBearing": 281,
        "cloudCover": 0.63,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263.75
      },
      {
        "time": 1543294800,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 57.76,
        "apparentTemperature": 57.76,
        "dewPoint": 52.43,
        "humidity": 0.82,
        "pressure": 1020.82,
        "windSpeed": 4.21,
        "windGust": 5.35,
        "windBearing": 280,
        "cloudCover": 0.54,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263.79
      },
      {
        "time": 1543298400,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0017,
        "precipProbability": 0.05,
        "precipType": "rain",
        "temperature": 57.42,
        "apparentTemperature": 57.42,
        "dewPoint": 52.26,
        "humidity": 0.83,
        "pressure": 1020.7,
        "windSpeed": 4.17,
        "windGust": 4.85,
        "windBearing": 281,
        "cloudCover": 0.47,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263.85
      },
      {
        "time": 1543302000,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0,
        "precipProbability": 0,
        "temperature": 56.94,
        "apparentTemperature": 56.94,
        "dewPoint": 51.92,
        "humidity": 0.83,
        "pressure": 1020.41,
        "windSpeed": 3.66,
        "windGust": 4.96,
        "windBearing": 344,
        "cloudCover": 0.4,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 264.11
      },
      {
        "time": 1543305600,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0003,
        "precipProbability": 0.03,
        "precipType": "rain",
        "temperature": 56.16,
        "apparentTemperature": 56.16,
        "dewPoint": 51.56,
        "humidity": 0.85,
        "pressure": 1020.05,
        "windSpeed": 3.44,
        "windGust": 5.86,
        "windBearing": 203,
        "cloudCover": 0.33,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 264.31
      },
      {
        "time": 1543309200,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0012,
        "precipProbability": 0.06,
        "precipType": "rain",
        "temperature": 55.45,
        "apparentTemperature": 55.45,
        "dewPoint": 51.15,
        "humidity": 0.85,
        "pressure": 1019.89,
        "windSpeed": 4.59,
        "windGust": 6.8,
        "windBearing": 252,
        "cloudCover": 0.46,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 264.35
      },
      {
        "time": 1543312800,
        "summary": "Partly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0006,
        "precipProbability": 0.05,
        "precipType": "rain",
        "temperature": 55.45,
        "apparentTemperature": 55.45,
        "dewPoint": 51.29,
        "humidity": 0.86,
        "pressure": 1019.82,
        "windSpeed": 3.96,
        "windGust": 4.33,
        "windBearing": 262,
        "cloudCover": 0.49,
        "uvIndex": 0,
        "visibility": 9.62,
        "ozone": 263.97
      },
      {
        "time": 1543316400,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0005,
        "precipProbability": 0.07,
        "precipType": "rain",
        "temperature": 54.78,
        "apparentTemperature": 54.78,
        "dewPoint": 51.23,
        "humidity": 0.88,
        "pressure": 1020.16,
        "windSpeed": 3.62,
        "windGust": 4.16,
        "windBearing": 231,
        "cloudCover": 0.62,
        "uvIndex": 0,
        "visibility": 7.3,
        "ozone": 263.33
      },
      {
        "time": 1543320000,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0006,
        "precipProbability": 0.08,
        "precipType": "rain",
        "temperature": 54.12,
        "apparentTemperature": 54.12,
        "dewPoint": 51.3,
        "humidity": 0.9,
        "pressure": 1020.29,
        "windSpeed": 3.78,
        "windGust": 4.31,
        "windBearing": 222,
        "cloudCover": 0.75,
        "uvIndex": 0,
        "visibility": 5.82,
        "ozone": 263.05
      },
      {
        "time": 1543323600,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0012,
        "precipProbability": 0.1,
        "precipType": "rain",
        "temperature": 53.71,
        "apparentTemperature": 53.71,
        "dewPoint": 51.52,
        "humidity": 0.92,
        "pressure": 1020.04,
        "windSpeed": 4.09,
        "windGust": 4.64,
        "windBearing": 208,
        "cloudCover": 0.83,
        "uvIndex": 0,
        "visibility": 6.23,
        "ozone": 263.44
      },
      {
        "time": 1543327200,
        "summary": "Mostly Cloudy",
        "icon": "partly-cloudy-night",
        "precipIntensity": 0.0024,
        "precipProbability": 0.13,
        "precipType": "rain",
        "temperature": 53.5,
        "apparentTemperature": 53.5,
        "dewPoint": 51.87,
        "humidity": 0.94,
        "pressure": 1019.59,
        "windSpeed": 4.68,
        "windGust": 5.2,
        "windBearing": 178,
        "cloudCover": 0.93,
        "uvIndex": 0,
        "visibility": 7.12,
        "ozone": 264.17
      },
      {
        "time": 1543330800,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0031,
        "precipProbability": 0.16,
        "precipType": "rain",
        "temperature": 53.53,
        "apparentTemperature": 53.53,
        "dewPoint": 52.24,
        "humidity": 0.95,
        "pressure": 1019.2,
        "windSpeed": 5.43,
        "windGust": 6.5,
        "windBearing": 168,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 7.86,
        "ozone": 264.68
      },
      {
        "time": 1543334400,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0019,
        "precipProbability": 0.21,
        "precipType": "rain",
        "temperature": 53.99,
        "apparentTemperature": 53.99,
        "dewPoint": 52.57,
        "humidity": 0.95,
        "pressure": 1019.12,
        "windSpeed": 6.12,
        "windGust": 9.3,
        "windBearing": 168,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 9.6,
        "ozone": 264.92
      },
      {
        "time": 1543338000,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0037,
        "precipProbability": 0.29,
        "precipType": "rain",
        "temperature": 54.68,
        "apparentTemperature": 54.68,
        "dewPoint": 52.92,
        "humidity": 0.94,
        "pressure": 1019.09,
        "windSpeed": 6.93,
        "windGust": 12.9,
        "windBearing": 174,
        "cloudCover": 1,
        "uvIndex": 1,
        "visibility": 10,
        "ozone": 264.98
      },
      {
        "time": 1543341600,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0072,
        "precipProbability": 0.35,
        "precipType": "rain",
        "temperature": 54.94,
        "apparentTemperature": 54.94,
        "dewPoint": 53.37,
        "humidity": 0.94,
        "pressure": 1018.93,
        "windSpeed": 7.8,
        "windGust": 15.97,
        "windBearing": 179,
        "cloudCover": 0.99,
        "uvIndex": 1,
        "visibility": 10,
        "ozone": 264.98
      },
      {
        "time": 1543345200,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0157,
        "precipProbability": 0.48,
        "precipType": "rain",
        "temperature": 55.46,
        "apparentTemperature": 55.46,
        "dewPoint": 53.99,
        "humidity": 0.95,
        "pressure": 1018.47,
        "windSpeed": 8.81,
        "windGust": 18.24,
        "windBearing": 182,
        "cloudCover": 0.99,
        "uvIndex": 2,
        "visibility": 10,
        "ozone": 265.02
      },
      {
        "time": 1543348800,
        "summary": "Light Rain",
        "icon": "rain",
        "precipIntensity": 0.0479,
        "precipProbability": 0.65,
        "precipType": "rain",
        "temperature": 55.9,
        "apparentTemperature": 55.9,
        "dewPoint": 54.7,
        "humidity": 0.96,
        "pressure": 1017.85,
        "windSpeed": 9.86,
        "windGust": 20.02,
        "windBearing": 184,
        "cloudCover": 0.99,
        "uvIndex": 2,
        "visibility": 10,
        "ozone": 264.96
      },
      {
        "time": 1543352400,
        "summary": "Rain",
        "icon": "rain",
        "precipIntensity": 0.0764,
        "precipProbability": 0.72,
        "precipType": "rain",
        "temperature": 56.35,
        "apparentTemperature": 56.35,
        "dewPoint": 55.35,
        "humidity": 0.96,
        "pressure": 1017.26,
        "windSpeed": 10.62,
        "windGust": 20.68,
        "windBearing": 186,
        "cloudCover": 1,
        "uvIndex": 2,
        "visibility": 8.83,
        "ozone": 265
      },
      {
        "time": 1543356000,
        "summary": "Rain",
        "icon": "rain",
        "precipIntensity": 0.0575,
        "precipProbability": 0.7,
        "precipType": "rain",
        "temperature": 56.83,
        "apparentTemperature": 56.83,
        "dewPoint": 55.92,
        "humidity": 0.97,
        "pressure": 1016.73,
        "windSpeed": 11.05,
        "windGust": 19.67,
        "windBearing": 187,
        "cloudCover": 1,
        "uvIndex": 1,
        "visibility": 7.51,
        "ozone": 265.13
      },
      {
        "time": 1543359600,
        "summary": "Light Rain",
        "icon": "rain",
        "precipIntensity": 0.0296,
        "precipProbability": 0.62,
        "precipType": "rain",
        "temperature": 57.36,
        "apparentTemperature": 57.36,
        "dewPoint": 56.44,
        "humidity": 0.97,
        "pressure": 1016.22,
        "windSpeed": 11.22,
        "windGust": 17.51,
        "windBearing": 187,
        "cloudCover": 1,
        "uvIndex": 1,
        "visibility": 6.23,
        "ozone": 265.17
      },
      {
        "time": 1543363200,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0203,
        "precipProbability": 0.55,
        "precipType": "rain",
        "temperature": 57.89,
        "apparentTemperature": 57.91,
        "dewPoint": 56.87,
        "humidity": 0.96,
        "pressure": 1015.91,
        "windSpeed": 11.06,
        "windGust": 15.35,
        "windBearing": 188,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 5.73,
        "ozone": 265.06
      },
      {
        "time": 1543366800,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0161,
        "precipProbability": 0.51,
        "precipType": "rain",
        "temperature": 58.92,
        "apparentTemperature": 58.93,
        "dewPoint": 57.23,
        "humidity": 0.94,
        "pressure": 1015.94,
        "windSpeed": 10.52,
        "windGust": 13.45,
        "windBearing": 190,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 6.82,
        "ozone": 264.48
      },
      {
        "time": 1543370400,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0118,
        "precipProbability": 0.39,
        "precipType": "rain",
        "temperature": 59.49,
        "apparentTemperature": 59.52,
        "dewPoint": 57.5,
        "humidity": 0.93,
        "pressure": 1016.17,
        "windSpeed": 9.67,
        "windGust": 11.57,
        "windBearing": 194,
        "cloudCover": 0.99,
        "uvIndex": 0,
        "visibility": 8.81,
        "ozone": 263.72
      },
      {
        "time": 1543374000,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0091,
        "precipProbability": 0.34,
        "precipType": "rain",
        "temperature": 59.84,
        "apparentTemperature": 59.88,
        "dewPoint": 57.7,
        "humidity": 0.93,
        "pressure": 1016.37,
        "windSpeed": 8.83,
        "windGust": 10.03,
        "windBearing": 198,
        "cloudCover": 0.99,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 262.88
      },
      {
        "time": 1543377600,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0063,
        "precipProbability": 0.25,
        "precipType": "rain",
        "temperature": 59.9,
        "apparentTemperature": 59.95,
        "dewPoint": 57.82,
        "humidity": 0.93,
        "pressure": 1016.46,
        "windSpeed": 8.04,
        "windGust": 9.12,
        "windBearing": 206,
        "cloudCover": 0.98,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 261.93
      },
      {
        "time": 1543381200,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0049,
        "precipProbability": 0.18,
        "precipType": "rain",
        "temperature": 59.77,
        "apparentTemperature": 59.84,
        "dewPoint": 57.86,
        "humidity": 0.93,
        "pressure": 1016.52,
        "windSpeed": 7.25,
        "windGust": 8.6,
        "windBearing": 216,
        "cloudCover": 0.97,
        "uvIndex": 0,
        "visibility": 9.61,
        "ozone": 261
      },
      {
        "time": 1543384800,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.005,
        "precipProbability": 0.16,
        "precipType": "rain",
        "temperature": 59.51,
        "apparentTemperature": 59.58,
        "dewPoint": 57.76,
        "humidity": 0.94,
        "pressure": 1016.58,
        "windSpeed": 6.59,
        "windGust": 8.16,
        "windBearing": 224,
        "cloudCover": 0.96,
        "uvIndex": 0,
        "visibility": 9.28,
        "ozone": 260.64
      },
      {
        "time": 1543388400,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0046,
        "precipProbability": 0.15,
        "precipType": "rain",
        "temperature": 59.24,
        "apparentTemperature": 59.28,
        "dewPoint": 57.49,
        "humidity": 0.94,
        "pressure": 1016.65,
        "windSpeed": 6,
        "windGust": 7.67,
        "windBearing": 229,
        "cloudCover": 0.97,
        "uvIndex": 0,
        "visibility": 9.93,
        "ozone": 261.01
      },
      {
        "time": 1543392000,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.004,
        "precipProbability": 0.14,
        "precipType": "rain",
        "temperature": 58.98,
        "apparentTemperature": 58.98,
        "dewPoint": 57.08,
        "humidity": 0.93,
        "pressure": 1016.72,
        "windSpeed": 5.5,
        "windGust": 7.24,
        "windBearing": 233,
        "cloudCover": 0.99,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 262.13
      },
      {
        "time": 1543395600,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0037,
        "precipProbability": 0.14,
        "precipType": "rain",
        "temperature": 58.83,
        "apparentTemperature": 58.83,
        "dewPoint": 56.69,
        "humidity": 0.93,
        "pressure": 1016.62,
        "windSpeed": 5.11,
        "windGust": 7,
        "windBearing": 235,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 263.38
      },
      {
        "time": 1543399200,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0035,
        "precipProbability": 0.13,
        "precipType": "rain",
        "temperature": 58.71,
        "apparentTemperature": 58.71,
        "dewPoint": 56.36,
        "humidity": 0.92,
        "pressure": 1016.2,
        "windSpeed": 4.83,
        "windGust": 7.06,
        "windBearing": 238,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 264.89
      },
      {
        "time": 1543402800,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0036,
        "precipProbability": 0.13,
        "precipType": "rain",
        "temperature": 58.46,
        "apparentTemperature": 58.46,
        "dewPoint": 56.03,
        "humidity": 0.92,
        "pressure": 1015.62,
        "windSpeed": 4.61,
        "windGust": 7.27,
        "windBearing": 249,
        "cloudCover": 0.99,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 266.67
      },
      {
        "time": 1543406400,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0046,
        "precipProbability": 0.16,
        "precipType": "rain",
        "temperature": 58.15,
        "apparentTemperature": 58.15,
        "dewPoint": 55.7,
        "humidity": 0.92,
        "pressure": 1015.15,
        "windSpeed": 4.35,
        "windGust": 7.2,
        "windBearing": 244,
        "cloudCover": 0.99,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 268.4
      },
      {
        "time": 1543410000,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0094,
        "precipProbability": 0.29,
        "precipType": "rain",
        "temperature": 57.55,
        "apparentTemperature": 57.55,
        "dewPoint": 55.33,
        "humidity": 0.92,
        "pressure": 1014.92,
        "windSpeed": 3.68,
        "windGust": 6.62,
        "windBearing": 225,
        "cloudCover": 0.99,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 269.99
      },
      {
        "time": 1543413600,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0204,
        "precipProbability": 0.45,
        "precipType": "rain",
        "temperature": 57,
        "apparentTemperature": 57,
        "dewPoint": 54.94,
        "humidity": 0.93,
        "pressure": 1014.8,
        "windSpeed": 2.4,
        "windGust": 5.86,
        "windBearing": 211,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 271.5
      },
      {
        "time": 1543417200,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0273,
        "precipProbability": 0.56,
        "precipType": "rain",
        "temperature": 56.66,
        "apparentTemperature": 56.66,
        "dewPoint": 54.68,
        "humidity": 0.93,
        "pressure": 1014.68,
        "windSpeed": 2.54,
        "windGust": 5.27,
        "windBearing": 188,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 272.94
      },
      {
        "time": 1543420800,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0179,
        "precipProbability": 0.54,
        "precipType": "rain",
        "temperature": 56.7,
        "apparentTemperature": 56.7,
        "dewPoint": 54.64,
        "humidity": 0.93,
        "pressure": 1014.57,
        "windSpeed": 3.19,
        "windGust": 4.92,
        "windBearing": 183,
        "cloudCover": 1,
        "uvIndex": 0,
        "visibility": 10,
        "ozone": 274.13
      },
      {
        "time": 1543424400,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0065,
        "precipProbability": 0.42,
        "precipType": "rain",
        "temperature": 57.02,
        "apparentTemperature": 57.02,
        "dewPoint": 54.73,
        "humidity": 0.92,
        "pressure": 1014.46,
        "windSpeed": 4.02,
        "windGust": 4.89,
        "windBearing": 182,
        "cloudCover": 1,
        "uvIndex": 1,
        "visibility": 10,
        "ozone": 275.34
      },
      {
        "time": 1543428000,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.0033,
        "precipProbability": 0.35,
        "precipType": "rain",
        "temperature": 57.09,
        "apparentTemperature": 57.09,
        "dewPoint": 54.8,
        "humidity": 0.92,
        "pressure": 1014.22,
        "windSpeed": 4.89,
        "windGust": 5.34,
        "windBearing": 191,
        "cloudCover": 1,
        "uvIndex": 1,
        "visibility": 10,
        "ozone": 276.8
      },
      {
        "time": 1543431600,
        "summary": "Overcast",
        "icon": "cloudy",
        "precipIntensity": 0.004,
        "precipProbability": 0.34,
        "precipType": "rain",
        "temperature": 57.38,
        "apparentTemperature": 57.38,
        "dewPoint": 54.8,
        "humidity": 0.91,
        "pressure": 1013.81,
        "windSpeed": 5.33,
        "windGust": 5.63,
        "windBearing": 192,
        "cloudCover": 1,
        "uvIndex": 2,
        "visibility": 10,
        "ozone": 278.16
      }
    ]
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
      },
      {
        "time": 1543392000,
        "summary": "Rain starting in the evening and breezy overnight.",
        "icon": "rain",
        "sunriseTime": 1543417524,
        "sunsetTime": 1543452790,
        "moonPhase": 0.7,
        "precipIntensity": 0.0179,
        "precipIntensityMax": 0.0614,
        "precipIntensityMaxTime": 1543474800,
        "precipProbability": 0.93,
        "precipType": "rain",
        "temperatureHigh": 58.53,
        "temperatureHighTime": 1543442400,
        "temperatureLow": 56.16,
        "temperatureLowTime": 1543489200,
        "apparentTemperatureHigh": 58.53,
        "apparentTemperatureHighTime": 1543442400,
        "apparentTemperatureLow": 56.16,
        "apparentTemperatureLowTime": 1543489200,
        "dewPoint": 54.9,
        "humidity": 0.9,
        "pressure": 1012.36,
        "windSpeed": 6.03,
        "windGust": 28.36,
        "windGustTime": 1543474800,
        "windBearing": 185,
        "cloudCover": 0.94,
        "uvIndex": 2,
        "uvIndexTime": 1543431600,
        "visibility": 10,
        "ozone": 287.4,
        "temperatureMin": 56.53,
        "temperatureMinTime": 1543474800,
        "temperatureMax": 58.98,
        "temperatureMaxTime": 1543392000,
        "apparentTemperatureMin": 56.53,
        "apparentTemperatureMinTime": 1543474800,
        "apparentTemperatureMax": 58.98,
        "apparentTemperatureMaxTime": 1543392000
      },
      {
        "time": 1543478400,
        "summary": "Rain until afternoon and breezy throughout the day.",
        "icon": "rain",
        "sunriseTime": 1543503982,
        "sunsetTime": 1543539174,
        "moonPhase": 0.74,
        "precipIntensity": 0.0424,
        "precipIntensityMax": 0.0972,
        "precipIntensityMaxTime": 1543482000,
        "precipProbability": 0.99,
        "precipType": "rain",
        "temperatureHigh": 58.12,
        "temperatureHighTime": 1543536000,
        "temperatureLow": 52.4,
        "temperatureLowTime": 1543590000,
        "apparentTemperatureHigh": 58.12,
        "apparentTemperatureHighTime": 1543536000,
        "apparentTemperatureLow": 52.4,
        "apparentTemperatureLowTime": 1543590000,
        "dewPoint": 51.29,
        "humidity": 0.82,
        "pressure": 1002.4,
        "windSpeed": 10.9,
        "windGust": 39.05,
        "windGustTime": 1543543200,
        "windBearing": 246,
        "cloudCover": 0.63,
        "uvIndex": 2,
        "uvIndexTime": 1543518000,
        "visibility": 7.29,
        "ozone": 326.71,
        "temperatureMin": 54.84,
        "temperatureMinTime": 1543561200,
        "temperatureMax": 58.12,
        "temperatureMaxTime": 1543536000,
        "apparentTemperatureMin": 54.84,
        "apparentTemperatureMinTime": 1543561200,
        "apparentTemperatureMax": 58.12,
        "apparentTemperatureMaxTime": 1543536000
      },
      {
        "time": 1543564800,
        "summary": "Rain overnight.",
        "icon": "rain",
        "sunriseTime": 1543590440,
        "sunsetTime": 1543625559,
        "moonPhase": 0.78,
        "precipIntensity": 0.0003,
        "precipIntensityMax": 0.0049,
        "precipIntensityMaxTime": 1543647600,
        "precipProbability": 0.11,
        "precipType": "rain",
        "temperatureHigh": 56.96,
        "temperatureHighTime": 1543615200,
        "temperatureLow": 51.84,
        "temperatureLowTime": 1543654800,
        "apparentTemperatureHigh": 56.96,
        "apparentTemperatureHighTime": 1543615200,
        "apparentTemperatureLow": 51.84,
        "apparentTemperatureLowTime": 1543654800,
        "dewPoint": 43.64,
        "humidity": 0.67,
        "pressure": 1019,
        "windSpeed": 8.94,
        "windGust": 32.31,
        "windGustTime": 1543564800,
        "windBearing": 291,
        "cloudCover": 0.81,
        "uvIndex": 2,
        "uvIndexTime": 1543604400,
        "visibility": 10,
        "ozone": 299.17,
        "temperatureMin": 52.31,
        "temperatureMinTime": 1543647600,
        "temperatureMax": 56.96,
        "temperatureMaxTime": 1543615200,
        "apparentTemperatureMin": 52.31,
        "apparentTemperatureMinTime": 1543647600,
        "apparentTemperatureMax": 56.96,
        "apparentTemperatureMaxTime": 1543615200
      },
      {
        "time": 1543651200,
        "summary": "Rain until afternoon and breezy throughout the day.",
        "icon": "rain",
        "sunriseTime": 1543676897,
        "sunsetTime": 1543711947,
        "moonPhase": 0.82,
        "precipIntensity": 0.0263,
        "precipIntensityMax": 0.0844,
        "precipIntensityMaxTime": 1543698000,
        "precipProbability": 0.77,
        "precipType": "rain",
        "temperatureHigh": 56.35,
        "temperatureHighTime": 1543698000,
        "temperatureLow": 48.92,
        "temperatureLowTime": 1543759200,
        "apparentTemperatureHigh": 56.35,
        "apparentTemperatureHighTime": 1543698000,
        "apparentTemperatureLow": 44.93,
        "apparentTemperatureLowTime": 1543755600,
        "dewPoint": 45.29,
        "humidity": 0.73,
        "pressure": 1014.54,
        "windSpeed": 13.55,
        "windGust": 35.25,
        "windGustTime": 1543719600,
        "windBearing": 269,
        "cloudCover": 0.57,
        "uvIndex": 2,
        "uvIndexTime": 1543690800,
        "visibility": 9.24,
        "ozone": 333.72,
        "temperatureMin": 51.84,
        "temperatureMinTime": 1543654800,
        "temperatureMax": 56.35,
        "temperatureMaxTime": 1543698000,
        "apparentTemperatureMin": 51.84,
        "apparentTemperatureMinTime": 1543654800,
        "apparentTemperatureMax": 56.35,
        "apparentTemperatureMaxTime": 1543698000
      },
      {
        "time": 1543737600,
        "summary": "Partly cloudy in the afternoon.",
        "icon": "partly-cloudy-day",
        "sunriseTime": 1543763353,
        "sunsetTime": 1543798337,
        "moonPhase": 0.85,
        "precipIntensity": 0.0002,
        "precipIntensityMax": 0.0011,
        "precipIntensityMaxTime": 1543795200,
        "precipProbability": 0.09,
        "precipType": "rain",
        "temperatureHigh": 54.91,
        "temperatureHighTime": 1543788000,
        "temperatureLow": 47.48,
        "temperatureLowTime": 1543849200,
        "apparentTemperatureHigh": 54.91,
        "apparentTemperatureHighTime": 1543788000,
        "apparentTemperatureLow": 45.91,
        "apparentTemperatureLowTime": 1543849200,
        "dewPoint": 39.81,
        "humidity": 0.64,
        "pressure": 1019.16,
        "windSpeed": 10.85,
        "windGust": 29.85,
        "windGustTime": 1543737600,
        "windBearing": 327,
        "cloudCover": 0.08,
        "uvIndex": 2,
        "uvIndexTime": 1543777200,
        "visibility": 10,
        "ozone": 330.54,
        "temperatureMin": 48.92,
        "temperatureMinTime": 1543759200,
        "temperatureMax": 54.91,
        "temperatureMaxTime": 1543788000,
        "apparentTemperatureMin": 44.93,
        "apparentTemperatureMinTime": 1543755600,
        "apparentTemperatureMax": 54.91,
        "apparentTemperatureMaxTime": 1543788000
      },
      {
        "time": 1543824000,
        "summary": "Partly cloudy overnight.",
        "icon": "partly-cloudy-night",
        "sunriseTime": 1543849809,
        "sunsetTime": 1543884728,
        "moonPhase": 0.89,
        "precipIntensity": 0,
        "precipIntensityMax": 0.0001,
        "precipIntensityMaxTime": 1543845600,
        "precipProbability": 0,
        "temperatureHigh": 57.04,
        "temperatureHighTime": 1543878000,
        "temperatureLow": 44.91,
        "temperatureLowTime": 1543935600,
        "apparentTemperatureHigh": 57.04,
        "apparentTemperatureHighTime": 1543878000,
        "apparentTemperatureLow": 39.67,
        "apparentTemperatureLowTime": 1543935600,
        "dewPoint": 34.59,
        "humidity": 0.52,
        "pressure": 1022.94,
        "windSpeed": 5.92,
        "windGust": 15.59,
        "windGustTime": 1543892400,
        "windBearing": 20,
        "cloudCover": 0.02,
        "uvIndex": 2,
        "uvIndexTime": 1543863600,
        "visibility": 10,
        "ozone": 296.61,
        "temperatureMin": 47.48,
        "temperatureMinTime": 1543849200,
        "temperatureMax": 57.04,
        "temperatureMaxTime": 1543878000,
        "apparentTemperatureMin": 45.91,
        "apparentTemperatureMinTime": 1543849200,
        "apparentTemperatureMax": 57.04,
        "apparentTemperatureMaxTime": 1543878000
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
/*
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


class TableViewController: UITableViewController {
    
    var myRequestJson: mainJson?
    
    @IBOutlet var myTableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        do {
//            let weatherArray = try JSONDecoder().decode(mainJson.self, from: json)
//            print(weatherArray.daily.data.first.debugDescription)
//        }
//        catch {
//            print(error.localizedDescription)
//        }
        
         guard let url = URL(string: "https://api.darksky.net/forecast/59c6b6b7efd5c3fc0f617338cfae6c48/37.8267,-122.4233") else {
         fatalError("Failed to create URL with https://api.darksky.net/forecast/59c6b6b7efd5c3fc0f617338cfae6c48/37.8267,-122.4233")
         }
         var request = URLRequest(url: url)
         request.httpMethod = "GET"
         URLSession.shared.dataTask(with : request) {
         (data, response, error) in if error != nil {
         fatalError(
         "Failed Network Request at \(String(describing: request.url))")
         }else{
            OperationQueue.main.addOperation {
            do{
                self.myRequestJson = try JSONDecoder().decode(mainJson.self, from : data!)
                 }catch{
                 fatalError("Failed to Initialize JSON object \(error)")
                 }
                OperationQueue.main.addOperation {[weak self] in
                    print(self!.myRequestJson!.daily.data.count)
                }
            }
         }
         }.resume()
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWeatherCell", for: indexPath)

        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
