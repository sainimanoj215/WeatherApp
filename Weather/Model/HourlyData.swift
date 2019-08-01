//
//  HourlyData.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 31, 2019

import Foundation

struct HourlyData : Codable {
    
    let apparentTemperature : Double?
    let cloudCover : Int?
    let dewPoint : Double?
    let humidity : Double?
    let icon : String?
    let ozone : Double?
    let precipIntensity : Double?
    let precipProbability : Double?
    let precipType : String?
    let pressure : Double?
    let summary : String?
    let temperature : Double?
    let time : Int?
    let uvIndex : Int?
    let visibility : Int?
    let windBearing : Int?
    let windGust : Double?
    let windSpeed : Double?
    
    enum CodingKeys: String, CodingKey {
        case apparentTemperature = "apparentTemperature"
        case cloudCover = "cloudCover"
        case dewPoint = "dewPoint"
        case humidity = "humidity"
        case icon = "icon"
        case ozone = "ozone"
        case precipIntensity = "precipIntensity"
        case precipProbability = "precipProbability"
        case precipType = "precipType"
        case pressure = "pressure"
        case summary = "summary"
        case temperature = "temperature"
        case time = "time"
        case uvIndex = "uvIndex"
        case visibility = "visibility"
        case windBearing = "windBearing"
        case windGust = "windGust"
        case windSpeed = "windSpeed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        apparentTemperature = try? values.decodeIfPresent(Double.self, forKey: .apparentTemperature) ?? 0.0
        cloudCover = try? values.decodeIfPresent(Int.self, forKey: .cloudCover) ?? 0
        dewPoint = try? values.decodeIfPresent(Double.self, forKey: .dewPoint) ?? 0.0
        humidity = try? values.decodeIfPresent(Double.self, forKey: .humidity) ?? 0.0
        icon = try? values.decodeIfPresent(String.self, forKey: .icon)
        ozone = try? values.decodeIfPresent(Double.self, forKey: .ozone) ?? 0.0
        precipIntensity = try? values.decodeIfPresent(Double.self, forKey: .precipIntensity) ?? 0.0
        precipProbability = try? values.decodeIfPresent(Double.self, forKey: .precipProbability) ?? 0.0
        precipType = try? values.decodeIfPresent(String.self, forKey: .precipType)
        pressure = try? values.decodeIfPresent(Double.self, forKey: .pressure) ?? 0.0
        summary = try? values.decodeIfPresent(String.self, forKey: .summary)
        temperature = try? values.decodeIfPresent(Double.self, forKey: .temperature) ?? 0.0
        time = try? values.decodeIfPresent(Int.self, forKey: .time) ?? 0
        uvIndex = try? values.decodeIfPresent(Int.self, forKey: .uvIndex) ?? 0
        visibility = try? values.decodeIfPresent(Int.self, forKey: .visibility) ?? 0
        windBearing = try? values.decodeIfPresent(Int.self, forKey: .windBearing) ?? 0
        windGust = try? values.decodeIfPresent(Double.self, forKey: .windGust) ?? 0.0
        windSpeed = try? values.decodeIfPresent(Double.self, forKey: .windSpeed) ?? 0.0
    }
}
