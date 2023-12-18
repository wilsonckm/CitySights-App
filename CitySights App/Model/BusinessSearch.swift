//
//  BusinessSearch.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/13/23.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var region = Region()
    var total = 0
    
}

struct Region: Decodable {
    var center: Coordinate?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitutde: Double?
}
