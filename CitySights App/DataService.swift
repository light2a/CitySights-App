//
//  DataService.swift
//  CitySights App
//
//  Created by duc on 03/05/2024.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apikey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?) async ->[Business]{
        //check api key exist or not
        guard apikey != nil else {
            return [Business]()
        }
        var lat = 35.665517
        var long = 139.770398
        
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        //1 .  create url
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10"){
            //2.  create request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apikey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")

            //3. Send request
            do {
                let (data, response) = try await URLSession.shared.data(for: request)

                //4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
                
            }
            catch{
                print(error)
            }
        }
        return [Business]()
        
    }
}
