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
    @State private var searchText = ""
    @State private var performedSearchText = "" {
        didSet {
            refresh = true
        }
    }
    @State private var isSearchBarActive = false
    @State private var refresh = false {
        didSet {
            if refresh {
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(16)) {
                    refresh = false
                }
            }
        }
    }
    @State var mapRegion: MKCoordinateRegion? = nil
    
    
    @AppStorage("theme") var theme: String = "System"
    
    var filteredLocations: [Location] {
        if performedSearchText.isEmpty {
            return locationData.locations
        } else {
            return locationData.locations.filter { $0.name.localizedCaseInsensitiveContains(performedSearchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    ZStack {
                        if !refresh {
                            MapView(userLocation: $locationManager.userLocation, locations: filteredLocations, selectedLocation: $selectedLocation, isCenteredOnUserLocation: $isCenteredOnUserLocation, region: $mapRegion, maxWidth: geo.size.width)
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    
                    if let location = selectedLocation {
                        LocationDetailView(location: location, isSelected: $selectedLocation)
                            .transition(.move(edge: .bottom))
                            .animation(.easeInOut)
                            .onAppear {
                                isSearchBarActive = false
                            }
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            if selectedLocation == nil {
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
                .navigationBarItems(trailing: Button(action: {
                    isShowingSettings = true
                }) {
                    Image(systemName: "gear")
                        .resizable()
                        .font(.title)
                        .foregroundColor(.blue)
                        .frame(width: 25, height: 25)
                        .padding()
                })
                .preferredColorScheme(theme == "System" ? nil : (theme == "Light" ? .light : .dark))
                .overlay(
                    VStack {
                        if selectedLocation != nil {
                            // Hide the search bar when LocationDetailView is opened
                            EmptyView()
                        } else {
                            searchBar
                        }
                    }
                        .padding()
                        .padding(.top, -11)
                        .padding(.trailing, 60)
                    , alignment: .top
                )
            }
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(isShowingSettings: $isShowingSettings, theme: $theme)
        }
    }
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary)
            
            TextField("Search", text: $searchText, onCommit: performSearch)
            
            if !searchText.isEmpty { // Show the button only if searchText is not empty
                Button(action: {
                    isSearchBarActive = false
                    searchText = ""
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.primary)
                        .padding(.leading, 5)
                        .onTapGesture {
                            searchText = ""
                            performedSearchText = ""
                        }
                }
            }
        }
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(8)
        .padding(.horizontal, 10)
        .onTapGesture {
            isSearchBarActive = true
        }
    }
    
    func performSearch() {
        performedSearchText = searchText
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
