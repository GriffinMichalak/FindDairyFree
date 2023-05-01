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

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 42.3398, longitude: -71.0892), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    func isLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
           locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        }
        else {
            print("Location is off, go turn on")
        }
    }
    
    private func locationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("change settings")
        case .denied:
            print("you have denied, change settings")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthorization()
    }
    
    func centerMapOnUserLocation() {
        withAnimation(.easeInOut) {
            guard let location = locationManager?.location else { return }
            region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        }
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
