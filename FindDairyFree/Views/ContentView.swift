// ContentView.swift
// FindDairyFree
//
// Created by Griffin Michalak on 5/17/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var locationData = LocationData()
    @State private var selectedLocation: Location? = nil
    
    var body: some View {
        ZStack {
            MapView(userLocation: $locationManager.userLocation, locations: locationData.locations, selectedLocation: $selectedLocation)
                .edgesIgnoringSafeArea(.all)
            
            if let location = selectedLocation {
                LocationDetailView(location: location, isSelected: $selectedLocation)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
            }
        }
    }
}
