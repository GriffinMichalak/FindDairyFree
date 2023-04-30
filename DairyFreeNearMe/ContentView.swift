//
//  ContentView.swift
//  DairyFreeNearMe
//
//  Created by Griffin Michalak on 4/30/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    //42.3601° N, 71.0589° W
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
            
            Button(action: {
                viewModel.isLocationEnabled()
            }, label: {
                Image(systemName: "location")
                    .padding()
                    .background(Color.white)
                    .clipShape(Circle())
            })
            .padding(.trailing, 20)
            .padding(.bottom, 20)
        }
    }
}

