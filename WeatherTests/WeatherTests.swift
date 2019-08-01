//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Manoj Saini on 7/29/19.
//  Copyright © 2019 manoj. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {

    var currentWeatherVC : WeatherViewController!
    var weatherForecastVC : WeatherForecastViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        currentWeatherVC = navigationController.topViewController as? WeatherViewController
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        // The One Weird Trick!
        XCTAssertNotNil(navigationController.view)
        XCTAssertNotNil(currentWeatherVC.view)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let forecasData = dummyData()
        let jsonData = try? JSONSerialization.data(withJSONObject: forecasData as Any, options: .prettyPrinted)
        let forecast = try? JSONDecoder().decode(ForecastRootClass.self, from: jsonData!)
        DarkSkyConnection.shared.currentForeCast = forecast
        currentWeatherVC.loadView()
        currentWeatherVC.updateWeatherInfo(icon: DarkSkyEnum(rawValue: (forecast?.currently?.icon)!), temp: (forecast?.currently?.temperature)!, summary: (forecast?.currently?.summary)!)
        let temp = forecast?.currently?.temperature
        let tmp = (temp! - 32)/1.8000
        XCTAssertEqual(currentWeatherVC.tempTbl.text, "\(Int(tmp))ºC", "Current temperature not match")
        XCTAssertEqual(currentWeatherVC.weatherConditionLbl.text, forecast?.currently?.summary ?? "", "Current weather Condition not match")
    }
    
    func dummyData() -> [String:Any] {
        let data : [String : Any] = [
            "currently" : [
                "humidity" : 0.72999999999999998,
                "summary" : "Humid and Foggy",
                "cloudCover" : 0.76000000000000001,
                "temperature" : 88.450000000000003,
                "windGust" : 12.470000000000001,
                "apparentTemperature" : 103.20999999999999,
                "windSpeed" : 8.5999999999999996,
                "uvIndex" : 7,
                "icon" : "fog",
                "visibility" : 1.8620000000000001,
                "windBearing" : 102,
                "dewPoint" : 78.670000000000002,
                "precipProbability" : 0,
                "time" : 1564555811,
                "precipIntensity" : 0,
                "ozone" : 272.80000000000001,
                "pressure" : 999.94000000000005
            ],
            "longitude" : 77.092068999999995,
            "latitude" : 28.492701,
            "hourly" : [
                "summary" : "Possible light rain tomorrow morning.",
                "icon" : "rain",
                "data" : [
                [
                "windSpeed" : 8.7300000000000004,
                "pressure" : 1000.1,
                "windBearing" : 102,
                "humidity" : 0.72999999999999998,
                "uvIndex" : 7,
                "dewPoint" : 78.629999999999995,
                "temperature" : 88.430000000000007,
                "icon" : "fog",
                "time" : 1564554600,
                "precipIntensity" : 0,
                "windGust" : 12.43,
                "visibility" : 1.8620000000000001,
                "apparentTemperature" : 103.14,
                "summary" : "Humid and Foggy",
                "cloudCover" : 0.76000000000000001,
                "precipProbability" : 0,
                "ozone" : 272.69999999999999
                ],
                [
                "windSpeed" : 8.3200000000000003,
                "pressure" : 999.52999999999997,
                "windBearing" : 99,
                "humidity" : 0.72999999999999998,
                "uvIndex" : 7,
                "dewPoint" : 78.579999999999998,
                "temperature" : 88.340000000000003,
                "icon" : "partly-cloudy-day",
                "time" : 1564558200,
                "precipIntensity" : 0,
                "windGust" : 12.550000000000001,
                "visibility" : 2.5449999999999999,
                "apparentTemperature" : 102.91,
                "summary" : "Humid and Mostly Cloudy",
                "cloudCover" : 0.79000000000000004,
                "precipProbability" : 0,
                "ozone" : 273.10000000000002
                ],
                [
                "windSpeed" : 8.0800000000000001,
                "pressure" : 998.85000000000002,
                "windBearing" : 92,
                "humidity" : 0.70999999999999996,
                "uvIndex" : 6,
                "dewPoint" : 77.209999999999994,
                "temperature" : 87.969999999999999,
                "icon" : "cloudy",
                "time" : 1564561800,
                "precipIntensity" : 0,
                "windGust" : 12.460000000000001,
                "visibility" : 6.798,
                "apparentTemperature" : 100.47,
                "summary" : "Humid and Overcast",
                "cloudCover" : 0.88,
                "precipProbability" : 0,
                "ozone" : 273.69999999999999
                ]
                ]
            ],
            "daily" : [
                "summary" : "Light rain throughout the week, with high temperatures falling to 83°F on Sunday.",
                "icon" : "rain",
                "data" : [
                    [
                        "precipProbability" : 0.32000000000000001,
                        "apparentTemperatureLow" : 83.790000000000006,
                        "apparentTemperatureLowTime" : 1564623000,
                        "apparentTemperatureMaxTime" : 1564554600,
                        "apparentTemperatureHighTime" : 1564554600,
                        "humidity" : 0.72999999999999998,
                        "precipType" : "rain",
                        "uvIndex" : 7,
                        "precipIntensity" : 0.0015,
                        "temperatureMax" : 88.799999999999997,
                        "temperatureLowTime" : 1564623000,
                        "sunriseTime" : 1564532029,
                        "precipIntensityMaxTime" : 1564597800,
                        "apparentTemperatureHigh" : 103.14,
                        "dewPoint" : 75.879999999999995,
                        "windGustTime" : 1564511400,
                        "windGust" : 15.58,
                        "summary" : "Humid throughout the day.",
                        "windBearing" : 94,
                        "temperatureLow" : 79.469999999999999,
                        "temperatureHighTime" : 1564572600,
                        "uvIndexTime" : 1564554600,
                        "icon" : "rain",
                        "time" : 1564511400,
                        "temperatureMaxTime" : 1564572600,
                        "windSpeed" : 8.4900000000000002,
                        "pressure" : 999.07000000000005,
                        "precipIntensityMax" : 0.0067999999999999996,
                        "cloudCover" : 0.91000000000000003,
                        "sunsetTime" : 1564580686,
                        "ozone" : 275.69999999999999,
                        "apparentTemperatureMin" : 90.060000000000002,
                        "apparentTemperatureMinTime" : 1564597800,
                        "temperatureMin" : 83.209999999999994,
                        "apparentTemperatureMax" : 103.14,
                        "moonPhase" : 0.97999999999999998,
                        "temperatureHigh" : 88.799999999999997,
                        "visibility" : 7.5640000000000001,
                        "temperatureMinTime" : 1564525800
                    ]
                ]
            ],
            "flags" : [
                "units" : "us",
                "nearest-station" : 4.7649999999999997,
                "sources" : [
                "cmc",
                "gfs",
                "icon",
                "isd",
                "madis"
                ]
            ],
            "offset" : 5.5,
            "timezone" : "Asia/Kolkata"
        ]
        
        return data
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
