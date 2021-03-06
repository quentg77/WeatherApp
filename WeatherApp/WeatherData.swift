//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Quentin GUICHAOUA on 22/05/2019.
//  Copyright © 2019 Quentin GUICHAOUA. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    var currently:Currently
    var hourly:Hourly
    var daily:Daily
    var timezone:String
}

struct Currently: Decodable {
    var icon:String
    var temperature:Float
    var summary:String
    var windSpeed:Float
    var pressure:Float
    var humidity:Float
    var uvIndex:Int
}

struct Hourly: Decodable {
    struct Data: Decodable {
        var time:Int
        var icon:String
        var humidity:Float
        var temperature:Float
    }
    
    var summary:String
    var data:[Data]
}

struct Daily: Decodable {
    struct Data: Decodable {
        var time:Int
        var icon:String
        var temperatureHigh:Float
        var temperatureLow:Float
    }
    
    var summary:String
    var data:[Data]
}

class ExtraInfo {
    var value:Int
    var unity:ExtraUnity
    
    init(value:Int, unity:ExtraUnity) {
        self.value = value
        self.unity = unity
    }
}

enum ExtraUnity {
    case humidity
    case windSpeed
    case atmoPressure
    case uvIndex
}
