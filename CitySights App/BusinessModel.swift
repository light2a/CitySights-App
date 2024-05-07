//
//  BusinessModel.swift
//  CitySights App
//
//  Created by duc on 06/05/2024.
//

import Foundation
import SwiftUI
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {//first deligate de xac dinh vi tri , phai ke thua Nsobject
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var service = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        
        super.init()
        // add more function
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters//handle dong 56
        locationManager.delegate = self
        
    }
    func getBusiness(query: String?, options: String?, category: String?) {
        Task {
            businesses = await service.businessSearch(userLocation: currentUserLocation, query: query, option: options, catagory: category)
        }
    }
    
    func getUserLocation() {
        // check if we have permisssion
        
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)//error thoi
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        //Detect if user allowed the request location
        if(manager.authorizationStatus == .authorizedWhenInUse) {
            currentUserLocation = nil
            manager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentUserLocation = locations.last?.coordinate//ko nen fire multiple tine nen heandle
        if currentUserLocation == nil {
            getBusiness(query: nil, options: nil, category: nil)
        }
        manager.startUpdatingLocation()
    }
}
