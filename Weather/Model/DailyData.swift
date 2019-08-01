//
//  DailyData.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 31, 2019

import Foundation

struct DailyData : Codable {
    
    let apparentTemperatureHigh : Double?
    let apparentTemperatureHighTime : Int?
    let apparentTemperatureLow : Double?
    let apparentTemperatureLowTime : Int?
    let apparentTemperatureMax : Double?
    let apparentTemperatureMaxTime : Int?
    let apparentTemperatureMin : Double?
    let apparentTemperatureMinTime : Int?
    let cloudCover : Double?
    let dewPoint : Double?
    let humidity : Double?
    let icon : String?
    let moonPhase : Double?
    let ozone : Double?
    let precipIntensity : Double?
    let precipIntensityMax : Double?
    let precipIntensityMaxTime : Int?
    let precipProbability : Double?
    let precipType : String?
    let pressure : Double?
    let summary : String?
    let sunriseTime : Int?
    let sunsetTime : Int?
    let temperatureHigh : Double?
    let temperatureHighTime : Int?
    let temperatureLow : Double?
    let temperatureLowTime : Int?
    let temperatureMax : Double?
    let temperatureMaxTime : Int?
    let temperatureMin : Double?
    let temperatureMinTime : Int?
    let time : Int?
    let uvIndex : Int?
    let uvIndexTime : Int?
    let visibility : Double?
    let windBearing : Int?
    let windGust : Double?
    let windGustTime : Int?
    let windSpeed : Double?
    
    enum CodingKeys: String, CodingKey {
        case apparentTemperatureHigh = "apparentTemperatureHigh"
        case apparentTemperatureHighTime = "apparentTemperatureHighTime"
        case apparentTemperatureLow = "apparentTemperatureLow"
        case apparentTemperatureLowTime = "apparentTemperatureLowTime"
        case apparentTemperatureMax = "apparentTemperatureMax"
        case apparentTemperatureMaxTime = "apparentTemperatureMaxTime"
        case apparentTemperatureMin = "apparentTemperatureMin"
        case apparentTemperatureMinTime = "apparentTemperatureMinTime"
        case cloudCover = "cloudCover"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case icon = "icon"
        case moonPhase = "moonPhase"
        case ozone = "ozone"
        case precipIntensity = "precipIntensity"
        case precipIntensityMax = "precipIntensityMax"
        case precipIntensityMaxTime = "precipIntensityMaxTime"
        case precipProbability = "precipProbability"
        case precipType = "precipType"
        case pressure = "pressure"
        case summary = "summary"
        case sunriseTime = "sunriseTime"
        case sunsetTime = "sunsetTime"
        case temperatureHigh = "temperatureHigh"
        case temperatureHighTime = "temperatureHighTime"
        case temperatureLow = "temperatureLow"
        case temperatureLowTime = "temperatureLowTime"
        case temperatureMax = "temperatureMax"
        case temperatureMaxTime = "temperatureMaxTime"
        case temperatureMin = "temperatureMin"
        case temperatureMinTime = "temperatureMinTime"
        case time = "time"
        case uvIndex = "uvIndex"
        case uvIndexTime = "uvIndexTime"
        case visibility = "visibility"
        case windBearing = "windBearing"
        case windGust = "windGust"
        case windGustTime = "windGustTime"
        case windSpeed = "windSpeed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        apparentTemperatureHigh = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureHigh)
        apparentTemperatureHighTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureHighTime)
        apparentTemperatureLow = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureLow)
        apparentTemperatureLowTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureLowTime)
        apparentTemperatureMax = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureMax)
        apparentTemperatureMaxTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureMaxTime)
        apparentTemperatureMin = try values.decodeIfPresent(Double.self, forKey: .apparentTemperatureMin)
        apparentTemperatureMinTime = try values.decodeIfPresent(Int.self, forKey: .apparentTemperatureMinTime)
        cloudCover = try values.decodeIfPresent(Double.self, forKey: .cloudCover)
        dewPoint = try values.decodeIfPresent(Double.self, forKey: .dewPoint)
        humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        moonPhase = try values.decodeIfPresent(Double.self, forKey: .moonPhase)
        ozone = try values.decodeIfPresent(Double.self, forKey: .ozone)
        precipIntensity = try values.decodeIfPresent(Double.self, forKey: .precipIntensity)
        precipIntensityMax = try values.decodeIfPresent(Double.self, forKey: .precipIntensityMax)
        precipIntensityMaxTime = try values.decodeIfPresent(Int.self, forKey: .precipIntensityMaxTime)
        precipProbability = try values.decodeIfPresent(Double.self, forKey: .precipProbability)
        precipType = try values.decodeIfPresent(String.self, forKey: .precipType)
        pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
        sunriseTime = try values.decodeIfPresent(Int.self, forKey: .sunriseTime)
        sunsetTime = try values.decodeIfPresent(Int.self, forKey: .sunsetTime)
        temperatureHigh = try values.decodeIfPresent(Double.self, forKey: .temperatureHigh)
        temperatureHighTime = try values.decodeIfPresent(Int.self, forKey: .temperatureHighTime)
        temperatureLow = try values.decodeIfPresent(Double.self, forKey: .temperatureLow)
        temperatureLowTime = try values.decodeIfPresent(Int.self, forKey: .temperatureLowTime)
        temperatureMax = try values.decodeIfPresent(Double.self, forKey: .temperatureMax)
        temperatureMaxTime = try values.decodeIfPresent(Int.self, forKey: .temperatureMaxTime)
        temperatureMin = try values.decodeIfPresent(Double.self, forKey: .temperatureMin)
        temperatureMinTime = try values.decodeIfPresent(Int.self, forKey: .temperatureMinTime)
        time = try values.decodeIfPresent(Int.self, forKey: .time)
        uvIndex = try values.decodeIfPresent(Int.self, forKey: .uvIndex)
        uvIndexTime = try values.decodeIfPresent(Int.self, forKey: .uvIndexTime)
        visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
        windBearing = try values.decodeIfPresent(Int.self, forKey: .windBearing)
        windGust = try values.decodeIfPresent(Double.self, forKey: .windGust)
        windGustTime = try values.decodeIfPresent(Int.self, forKey: .windGustTime)
        windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
    }
    
}
