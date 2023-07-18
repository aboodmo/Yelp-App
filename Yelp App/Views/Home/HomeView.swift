//
//  HomeView.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 7/17/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    @State var isMapShowing = false
    
    var body: some View {
        if model.resturaunts.count != 0 || model.sights.count != 0 {
            
            if !isMapShowing{
                //Show list
                
                VStack{
                    HStack{
                        Image(systemName: "location")
                        Text("San Francisco")
                        Spacer()
                        Text("Switch to map view")
                        
                    }
                    Divider()
                    
                    BusinessList()
                }
            }else{
                //Show Map
                
            }
        }
        else{
            // waiting till data comes in
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
