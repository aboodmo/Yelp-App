//
//  Yelp_AppApp.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 8/8/22.
//

import SwiftUI

@main
struct Yelp_AppApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
