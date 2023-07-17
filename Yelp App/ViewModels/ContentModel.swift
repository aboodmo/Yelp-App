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
    
    @Published var resturaunts = [Business]()
    @Published var sights = [Business]()
    
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
            
            getBuisnesses(category: Constants.sightsKey, location: userlocation!)
            getBuisnesses(category: Constants.resturantsKey, location: userlocation!)
        }
    }
    
    func getBuisnesses(category: String, location: CLLocation){
        
        // Create URL
        
        
        var urlComponents = URLComponents(string: Constants.apiUrl)
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
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            // Get URLSession
            let session = URLSession.shared
            
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    
                    do{
                        // parse json
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            // Assign results to coresponding properties
                            switch category {
                            case Constants.sightsKey:
                                self.sights = result.businesses
                            case Constants.resturantsKey:
                                self.resturaunts = result.businesses
                            default:
                                break
                            }
                        }
                        
                        
                    }
                    catch{
                        print(error)
                    }
                    
                }
            }
            
            // Start Data Task
            dataTask.resume()
            
        }
        
    }
}
