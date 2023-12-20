//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/20/23.
//

import Foundation

import SwiftUI

@Observable
class BusinessModel {
    var businesses = [Business]()
    var query: String = ""
    var selectedBusiness: Business?
    
    var service = DataService()
    
    func getBusinsses() {
        Task {
            businesses = await service.businessSearch()
        }
    }
}
