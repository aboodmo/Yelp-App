//
//  BusinessSearch.swift
//  Yelp App
//
//  Created by Abdelrahman Mohammad on 7/17/23.
//

import Foundation

struct BusinessSearch: Decodable{
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
    
}

struct Region: Decodable {
    
    var center = Coordinate()
    
}
