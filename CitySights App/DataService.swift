//
//  DataService.swift
//  CitySights App
//
//  Created by Wilson Chan on 12/13/23.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?) async -> [Business] {
        // Check if api key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        //Default Lat and Long
        var lat = 35.667717
        var long = -122.406417
        
        //Updated Lat long to user location
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        //1. Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10") {
            //2. Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            //3. Send Request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                //4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return (result.businesses)
            }
            catch {
                print(error)
            }
        }
            return [Business]()
    }
}
