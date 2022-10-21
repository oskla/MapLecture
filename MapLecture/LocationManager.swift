//
//  LocationManager.swift
//  MapLecture
//
//  Created by Oskar Larsson on 2022-10-19.
//

import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    
   
    
    let manager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D?
    
   override init() {
       super.init()
       
       manager.delegate = self
       
        
    }
    
    func askPermission() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        case .notDetermined:
            askPermission()
        case .restricted, .denied:
            print("Meddela användaren att appen inte går att använda utan godkännande!")
        default:
            print("Något gick fel!")
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Din plats har uppdaterats!")
        currentLocation = locations.first?.coordinate
        print(locations)
    }
    
}
