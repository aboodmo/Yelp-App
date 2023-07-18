//
//  BusinessSection.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 7/17/23.
//

import SwiftUI

struct BusinessSection: View {
    var title: String
    var businesses: [Business]
    
    var body: some View {
        Section(header: BusinessSectionHeader(title: title)){
            ForEach(businesses) { business in
                BusinessRow(business: business)
            }
        }
    }
}
