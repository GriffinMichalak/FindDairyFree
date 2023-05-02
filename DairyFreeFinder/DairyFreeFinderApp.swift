//
//  DairyFreeFinderApp.swift
//  DairyFreeFinder
//
//  Created by Griffin Michalak on 4/30/23.
//

import SwiftUI

@main
struct DairyFreeFinderApp: App {
    
    @StateObject private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            //CurrentLocationView()
            LocationsView().environmentObject(vm)
            //ContentView()
        }
    }
}
