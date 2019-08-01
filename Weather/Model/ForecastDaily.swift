//
//  ForecastDaily.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on July 31, 2019

import Foundation

struct ForecastDaily : Codable {

        let data : [DailyData]?
        let icon : String?
        let summary : String?

        enum CodingKeys: String, CodingKey {
                case data = "data"
                case icon = "icon"
                case summary = "summary"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                data = try values.decodeIfPresent([DailyData].self, forKey: .data)
                icon = try values.decodeIfPresent(String.self, forKey: .icon)
                summary = try values.decodeIfPresent(String.self, forKey: .summary)
        }

}
