//
//  ContentView.swift
//  MapLecture
//
//  Created by Oskar Larsson on 2022-10-19.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 59.32483966691412,
            longitude: 18.070979829301514),
        span: MKCoordinateSpan(
            latitudeDelta: 0.55,
            longitudeDelta: 0.55))
    
    @State var places = [
        Place(
            name: "Ahmad",
            latitude: 59.40421484547954,
            longitude: 17.943158793583418),
        
//        Place(
//            name: "STI",
//            latitude: 59.3095678576429,
//            longitude: 18.021920463682868)
    ]
    
    @State var manager = LocationManager()
    
    
    func addMarker() {
        
        let randomOffset = Double.random(in: 0.0...0.09)
        
        
        let newMarker = Place(name: "NewMarker", latitude: 59.31278660510149 + randomOffset, longitude: 18.116823230960748 + randomOffset)
        
        places.append(newMarker)
        
    }
    
    
    var body: some View {
        VStack {
            
            Map(coordinateRegion: $region,
                interactionModes: [.all],
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: places) { place in
                
                MapAnnotation(coordinate: place.coordinates, content: {
                    VStack {
                        ZStack {
                            Circle()
                                .fill(.blue)
                                .frame(width: 30, height: 30)
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                    }
                })
                
                
            }.ignoresSafeArea()
                .onTapGesture {
                    //  addMarker()
                    
                }
            Button(action: {
                addMarker()
                
            }, label: {
                Text("Add marker")
            })
            Button(action: {
                manager.askPermission()
            }, label: {
                Text("Ask for permission")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
