//
//  ForecastRootClass.swift
//
//  Created on July 31, 2019

import Foundation

struct ForecastRootClass : Codable {

        let currently : ForecastCurrently?
        let daily : ForecastDaily?
        let flags : ForecastFlag?
        let hourly : ForecastHourly?
        let latitude : Double?
        let longitude : Double?
        let offset : Double?
        let timezone : String?

        enum CodingKeys: String, CodingKey {
                case currently = "currently"
                case daily = "daily"
                case flags = "flags"
                case hourly = "hourly"
                case latitude = "latitude"
                case longitude = "longitude"
                case offset = "offset"
                case timezone = "timezone"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                currently = try values.decodeIfPresent(ForecastCurrently.self, forKey: .currently)
                daily = try values.decodeIfPresent(ForecastDaily.self, forKey: .daily)
                flags = try values.decodeIfPresent(ForecastFlag.self, forKey: .flags)
                hourly = try values.decodeIfPresent(ForecastHourly.self, forKey: .hourly)
                latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
                longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
                offset = try values.decodeIfPresent(Double.self, forKey: .offset)
                timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
        }

}
