//
//  ForecastFlag.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 31, 2019

import Foundation

struct ForecastFlag : Codable {

        let nearestStation : Double?
        let sources : [String]?
        let units : String?

        enum CodingKeys: String, CodingKey {
                case nearestStation = "nearest-station"
                case sources = "sources"
                case units = "units"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                nearestStation = try values.decodeIfPresent(Double.self, forKey: .nearestStation)
                sources = try values.decodeIfPresent([String].self, forKey: .sources)
                units = try values.decodeIfPresent(String.self, forKey: .units)
        }

}
