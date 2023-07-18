//
//  LaunchView.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 8/8/22.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        // Desplays 3 different home view depending of if the user allowed geolocation
        
        if model.authorizationState == .notDetermined {
            
        }else if model.authorizationState == .authorizedAlways || model.authorizationState == .authorizedWhenInUse {
            HomeView()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
