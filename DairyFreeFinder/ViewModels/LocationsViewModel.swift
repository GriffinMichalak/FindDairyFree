//
//  LocationsViewModel.swift
//  DairyFreeFinder
//
//  Created by Griffin Michalak on 4/30/23.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    /**
     Represents all loaded locations.
     */
    @Published var locations: [Location]
    
    /**
     Current location on the map.
     */
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    /**
     Current region on map.
     */
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
    
    /**
     Show list of locations.
     */
    
    @Published var showLocationsList: Bool = false
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false; 
        }
    }
    
    /**
     Advances onto the next location when the 'Next' button is pressed.
     */
    func nextButtonPressed() {
        //get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation} )  else {
            print("Could not find current index in locations array.") //Shouldn't happen
            return
        }
        
        //check if current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else {
                return
            }
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
