//
//  TextHelper.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/15/23.
//

import Foundation

struct TextHelper {
    
    static func distanceAwayText(meters: Double) -> String {
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        }
        else {
            return "\(Int(round(meters))) m away"
        }
    }
    
}

