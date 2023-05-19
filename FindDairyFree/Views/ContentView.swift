// ContentView.swift
// FindDairyFree
//
// Created by Griffin Michalak on 5/17/23.
//

import SwiftUI
import MapKit
import Foundation
import Combine

/**
 The Home Page of the App.
 */
struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var locationData = LocationData()
    @State private var selectedLocation: Location? = nil
    @State private var isCenteredOnUserLocation = false
    @State private var isShowingSettings = false
    
    @AppStorage("theme") var theme: String = "System"
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView(userLocation: $locationManager.userLocation, locations: locationData.locations, selectedLocation: $selectedLocation, isCenteredOnUserLocation: $isCenteredOnUserLocation) // Pass the new state variable to MapView
                    .edgesIgnoringSafeArea(.all)
                
                if let location = selectedLocation {
                    LocationDetailView(location: location, isSelected: $selectedLocation)
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if selectedLocation == nil { //hides center-location button when LocationDetailView is up
                            Button(action: {
                                isCenteredOnUserLocation = false
                                isCenteredOnUserLocation.toggle()
                            }) {
                                Image(systemName: "location.fill")
                                    .font(.title)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 3)
                                    .foregroundColor(.blue)
                                    .colorScheme(.dark)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle(Text("FindDairyFree"))
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }) {
                Image(systemName: "gearshape")
                    .font(.title)
                    .foregroundColor(.blue)
            })
            .preferredColorScheme(theme == "System" ? nil : (theme == "Light" ? .light : .dark))
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(isShowingSettings: $isShowingSettings, theme: $theme)
        }
    }
}
