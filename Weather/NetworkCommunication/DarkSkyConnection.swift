//
//  DarkSkyConnection.swift
//  Weather
//
//  Created by Manoj Saini on 7/29/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//

import Foundation
import SwiftyJSON
import Alamofire

enum DarkSkyEnum : String {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
    case wind = "wind"
    case fog = "fog"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
    case hail = "hail"
    case thunderstorm = "thunderstorm"
    case tornado = "tornado"
    
    init(rawValue: String) {
        switch rawValue {
            case DarkSkyEnum.clearDay.rawValue : self = .clearDay
            case DarkSkyEnum.clearNight.rawValue : self = .clearNight
            case DarkSkyEnum.rain.rawValue : self = .rain
            case DarkSkyEnum.snow.rawValue : self = .snow
            case DarkSkyEnum.sleet.rawValue : self = .sleet
            case DarkSkyEnum.wind.rawValue : self = .wind
            case DarkSkyEnum.fog.rawValue : self = .fog
            case DarkSkyEnum.cloudy.rawValue : self = .cloudy
            case DarkSkyEnum.partlyCloudyDay.rawValue : self = .partlyCloudyDay
            case DarkSkyEnum.partlyCloudyNight.rawValue : self = .partlyCloudyNight
            case DarkSkyEnum.hail.rawValue : self = .hail
            case DarkSkyEnum.thunderstorm.rawValue : self = .thunderstorm
            case DarkSkyEnum.tornado.rawValue : self = .tornado
        default:
            self = .clearDay
        }
    }
    
    func getImage() -> UIImage? {
        switch self {
        case .clearDay:
            return #imageLiteral(resourceName: "sunny")
        case .clearNight:
            return #imageLiteral(resourceName: "Clear Night")
        case .rain:
           return #imageLiteral(resourceName: "shower3")
        case .snow:
           return #imageLiteral(resourceName: "snow4")
        case .sleet:
            return #imageLiteral(resourceName: "snow5")
        case .wind:
            return #imageLiteral(resourceName: "Wind")
        case .fog:
            return #imageLiteral(resourceName: "fog")
        case .cloudy:
           return #imageLiteral(resourceName: "cloudy2")
        case .partlyCloudyDay:
           return #imageLiteral(resourceName: "cloudy1")
        case .partlyCloudyNight:
            return #imageLiteral(resourceName: "Part Cloudy Night")
        case .hail:
            return #imageLiteral(resourceName: "storm1.imageset")
        case .thunderstorm:
            return #imageLiteral(resourceName: "storm2")
        case .tornado:
            return #imageLiteral(resourceName: "Tornado")
        }
    }
    
    func getBGImage() -> UIImage {
        switch self {
        case .clearDay:
            return #imageLiteral(resourceName: "BGsun")
        case .clearNight:
            return #imageLiteral(resourceName: "BGsun")
        case .rain:
            return #imageLiteral(resourceName: "BGrain")
        case .snow:
            return #imageLiteral(resourceName: "BGsnow")
        case .sleet:
            return #imageLiteral(resourceName: "BGcloud")
        case .wind:
            return #imageLiteral(resourceName: "BGcloud")
        case .fog:
            return #imageLiteral(resourceName: "BGfog")
        case .cloudy:
            return #imageLiteral(resourceName: "BGcloud")
        case .partlyCloudyDay:
            return #imageLiteral(resourceName: "BGcloud")
        case .partlyCloudyNight:
            return #imageLiteral(resourceName: "BGcloud")
        case .hail:
            return #imageLiteral(resourceName: "BGfog")
        case .thunderstorm:
            return #imageLiteral(resourceName: "BGfog")
        case .tornado:
            return #imageLiteral(resourceName: "BGfog")
        }
    }
}

class DarkSkyConnection : NSObject {
    static let shared = DarkSkyConnection()
    
    private override init() {
        super.init()
    }
    
    var currentForeCast : ForecastRootClass!
    
    public class func getCurrentTemperature(withBlock block : @escaping (DarkSkyEnum?, Double?, String?) -> ()) {
        if let currentForeCast = shared.currentForeCast {
            //Only check once an hour
            if let timestamp = currentForeCast.currently?.time {
                if timestamp > (Date().timeIntervalSince1970 - 3600) {
                    currentAPIHelper(withBlock: block)
                    return
                }
            }
        }
        
        var didReceiveLocation : Bool = false
        LocationManager.shared.latLongBlock = { (lat, long) in
            if !didReceiveLocation {
                getCurrentAPI(withLat: lat, withLong: long, withBlock: { (icon, temp, summary) in
                    block(icon, temp, summary)
                })
            }
            didReceiveLocation = true
            LocationManager.shared.setBlockToNil()
        }
        LocationManager.shared.load()
    }
    
    private class func currentAPIHelper(withBlock block : @escaping (DarkSkyEnum?, Double?, String?) -> ()) {
        if let json = shared.currentForeCast {
            if let currentTemp = json.currently?.temperature, let icon = json.currently?.icon {
               let summary = json.currently?.summary
                block(DarkSkyEnum(rawValue: icon), currentTemp, summary)
            }else {
                block(nil, nil, nil)
            }
        }else {
            block(nil, nil, nil)
        }
    }
    
    private class func getCurrentAPI(withLat lat : Double, withLong long : Double, withBlock block : @escaping (DarkSkyEnum?, Double?, String?) -> ()) {
        request("https://api.darksky.net/forecast/82b7ba03bdc60f01a7122da88edd5cc2/\(lat),\(long)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//            let json = JSON.init(response.result.value)
            let forecast = try? JSONDecoder().decode(ForecastRootClass.self, from: response.data!)
            shared.currentForeCast = forecast
            currentAPIHelper(withBlock: block)
        }
    }
}
