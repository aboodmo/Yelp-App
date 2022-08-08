//
//  ContentModel.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 8/8/22.
//

import Foundation
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        
        //
        locationManager.delegate = self
        
        // Request Permission for user Location
        locationManager.requestWhenInUseAuthorization()
        
        // Start geolocating user, after accepted
        
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            
            // We have Permission
            locationManager.startUpdatingLocation()
            
        }else if locationManager.authorizationStatus == .denied {
            
            // We DON'T have Permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Gives us Location of user
    
    }
}
