//
//  LocationManager.swift
//  Weather
//
//  Created by Manoj Saini on 7/29/19.
//  Copyright © 2019 manoj. All rights reserved.
//
//
import Foundation
import CoreLocation

class LocationManager : NSObject {
    static let shared = LocationManager()
    
    private override init() {
        super.init()
    }
    let locationManager = CLLocationManager()
    var currentLoc : CLLocationCoordinate2D!
    var latLongBlock : ((Double, Double) -> ())? {
        didSet {
            if latLongBlock == nil {
                locationManager.stopUpdatingLocation()
            }else {
                locationManager.startUpdatingLocation()
            }
        }
    }
    func load() {
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }
    }
    
    func removeAlwaysUpdate() {
        locationManager.stopUpdatingLocation()
    }
    
    func setBlockToNil() {
        latLongBlock = nil
    }
}

extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            if let block = latLongBlock {
                self.currentLoc = location.coordinate
                block(location.coordinate.latitude, location.coordinate.longitude)
                self.removeAlwaysUpdate()
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
}
