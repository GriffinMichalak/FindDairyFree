//
//  MapView.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/18/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var userLocation: CLLocationCoordinate2D?
        let locations: [Location]
        @Binding var selectedLocation: Location?
        @Binding var isCenteredOnUserLocation: Bool // New binding
        
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            mapView.showsUserLocation = true
            mapView.delegate = context.coordinator
            
            for location in locations {
                let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                annotation.title = location.name
                mapView.addAnnotation(annotation)
            }
            
            return mapView
        }
        
        func updateUIView(_ mapView: MKMapView, context: Context) {
            if let userLocation = userLocation {
                if isCenteredOnUserLocation {
                    mapView.setCenter(userLocation, animated: true)
                    isCenteredOnUserLocation = false // Reset the state variable to avoid continuous centering
                }
            }
        }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation is MKUserLocation {
                return nil
            }
            
            let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "CustomAnnotationView") as? MKMarkerAnnotationView ?? MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "CustomAnnotationView")
            annotationView.canShowCallout = true
            
            // Set marker tint color to blue
            annotationView.markerTintColor = .magenta
            
            let infoButton = UIButton(type: .infoDark)
            annotationView.rightCalloutAccessoryView = infoButton
            
            // Set custom image
            let image = UIImage(named: "idk yet")
            annotationView.glyphImage = image
            
            return annotationView
        }

        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation,
               let location = parent.locations.first(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }) {
                parent.selectedLocation = location
            }
        }
    }
}
