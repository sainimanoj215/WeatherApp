//
//  ForecastCurrently.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 31, 2019

import Foundation

struct ForecastCurrently : Codable {

        let apparentTemperature : Double?
        let cloudCover : Double?
        let dewPoint : Double?
        let humidity : Double?
        let icon : String?
        let nearestStormDistance : Int?
        let ozone : Double?
        let precipIntensity : Double?
        let precipProbability : Double?
        let precipType : String?
        let pressure : Double?
        let summary : String?
        let temperature : Double?
        let time : Double?
        let uvIndex : Int?
        let visibility : Double?
        let windBearing : Int?
        let windGust : Double?
        let windSpeed : Double?

        enum CodingKeys: String, CodingKey {
                case apparentTemperature = "apparentTemperature"
                case cloudCover = "cloudCover"
                case dewPoint = "dewPoint"
                case humidity = "humidity"
                case icon = "icon"
                case nearestStormDistance = "nearestStormDistance"
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
                apparentTemperature = try values.decodeIfPresent(Double.self, forKey: .apparentTemperature)
                cloudCover = try values.decodeIfPresent(Double.self, forKey: .cloudCover)
                dewPoint = try values.decodeIfPresent(Double.self, forKey: .dewPoint)
                humidity = try values.decodeIfPresent(Double.self, forKey: .humidity)
                icon = try values.decodeIfPresent(String.self, forKey: .icon)
                nearestStormDistance = try values.decodeIfPresent(Int.self, forKey: .nearestStormDistance)
                ozone = try values.decodeIfPresent(Double.self, forKey: .ozone)
                precipIntensity = try values.decodeIfPresent(Double.self, forKey: .precipIntensity)
                precipProbability = try values.decodeIfPresent(Double.self, forKey: .precipProbability)
                precipType = try values.decodeIfPresent(String.self, forKey: .precipType)
                pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)
                summary = try values.decodeIfPresent(String.self, forKey: .summary)
                temperature = try values.decodeIfPresent(Double.self, forKey: .temperature)
                time = try values.decodeIfPresent(Double.self, forKey: .time)
                uvIndex = try values.decodeIfPresent(Int.self, forKey: .uvIndex)
                visibility = try values.decodeIfPresent(Double.self, forKey: .visibility)
                windBearing = try values.decodeIfPresent(Int.self, forKey: .windBearing)
                windGust = try values.decodeIfPresent(Double.self, forKey: .windGust)
                windSpeed = try values.decodeIfPresent(Double.self, forKey: .windSpeed)
        }

}
