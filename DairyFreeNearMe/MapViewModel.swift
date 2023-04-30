//
//  MapViewModel.swift
//  DairyFreeNearMe
//
//  Created by Griffin Michalak on 4/30/23.
//

import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 42.3601, longitude: -71.0589)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager:CLLocationManager?
    
    func isLocationEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }
        else {
            //Allert the user location services is not
            //on and tells user to do so
        }
    }
    
    private func locationAuthorization() {
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                //your location is restricted
                break
            case .denied:
                //your location is denied. go into settings to change
                break
            case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationAuthorization()
    }
}
