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
        
        let userlocation = locations.first
        if userlocation != nil{
            
            locationManager.startUpdatingLocation()
            
            getBuisnesses(category: "resturants", location: userlocation!)
        }
    }
    
    func getBuisnesses(category: String, location: CLLocation){
        
        // Create URL
        
        
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        
        let url = urlComponents?.url
        
        if let url = url {
            // Create URL Request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
            request.httpMethod = "GET"
            request.addValue("Bearer Ckeb7zKUslUk99eDlocPIiaIR-eAu-2j-2NhNTirBkRgMvQ-NFHiNarl6JDZ9L_zCqX1y-6r6wbckN09ZSrKgmj42FemiAZpuuKYWD0PhVvk7-RcDh0cgbfqxoC0ZHYx", forHTTPHeaderField: "Authorization")
            
            // Get URLSession
            let session = URLSession.shared
            
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    print(response)
                }
            }
            
            // Start Data Task
            dataTask.resume()
            
        }
        
        
        
//        let urlString = "s"
//
//
//        let headers = ["accept": "application/json"]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://api.yelp.com/v3/businesses/search")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//          if (error != nil) {
//            print(error as Any)
//          } else {
//            let httpResponse = response as? HTTPURLResponse
//            print(httpResponse)
//          }
//        })
//
//        dataTask.resume()
        
        // Create URL Request
        
        // Get URLSession
        
        // Create Data Task
        
        // Start Data Task
    }
}
