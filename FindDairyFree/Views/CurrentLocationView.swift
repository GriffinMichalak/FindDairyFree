//
//  CurrentLocationView.swift
//  DairyFreeFinder
//
//  Created by Griffin Michalak on 5/1/23.
//

import SwiftUI
import MapKit

struct CurrentLocationView: View {
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
            ZStack(alignment: .bottomTrailing) {
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                    .ignoresSafeArea()
                centerLocationButton
                //LocationPreviewView(location: )
            }
            .onAppear {
                viewModel.isLocationEnabled()
            }
        
        
        }
}

struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentLocationView()
    }
}



extension CurrentLocationView {
    private var centerLocationButton: some View {
        Button(action: {
            viewModel.centerMapOnUserLocation()
        }) {
            Image(systemName: "location")
                .font(.title)
                .foregroundColor(.blue)
        }
        .frame(width: 50, height: 50)
        
        .background(Color.white)
        .clipShape(Circle())
        .padding(.trailing, 20)
        .padding(.bottom, 20)
    }
}
