//
//  Place.swift
//  MapLecture
//
//  Created by Oskar Larsson on 2022-10-19.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
    
    let id = UUID()
    var name: String
    var latitude: Double
    var longitude: Double
    
    var coordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    
}
