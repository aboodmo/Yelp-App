//
//  BusinessList.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 7/17/23.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]){
                BusinessSection(title: "Resturants", businesses: model.resturaunts)
                BusinessSection(title: "Sights", businesses: model.sights)
                
            }
        }
    }
}

struct BusinessList_Previews: PreviewProvider {
    static var previews: some View {
        BusinessList().environmentObject(ContentModel())
    }
}
