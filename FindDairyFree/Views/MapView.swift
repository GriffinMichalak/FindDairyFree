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
    @Binding var isCenteredOnUserLocation: Bool
    @Binding var region: MKCoordinateRegion?
    let maxWidth: CGFloat
    @State var initiallyLoaded: Bool
    @State var regionWasInitiallyNil: Bool
    
    init(userLocation: Binding<CLLocationCoordinate2D?>, locations: [Location], selectedLocation: Binding<Location?>, isCenteredOnUserLocation: Binding<Bool>, region: Binding<MKCoordinateRegion?>, maxWidth: CGFloat) {
        self._userLocation = userLocation
        self.locations = locations
        self._selectedLocation = selectedLocation
        self._isCenteredOnUserLocation = isCenteredOnUserLocation
        self._region = region
        self.maxWidth = maxWidth
        self._initiallyLoaded = State(initialValue: false)
        self._regionWasInitiallyNil = State(initialValue: (region.wrappedValue == nil))
    }
        
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
            mapView.showsCompass = false

            let compassBtn = MKCompassButton(mapView:mapView)
            compassBtn.frame.origin = CGPoint(x: maxWidth - 67, y: 100)
            compassBtn.compassVisibility = .visible
            mapView.addSubview(compassBtn)
            
            return mapView
        }
        
        func updateUIView(_ mapView: MKMapView, context: Context) {
            if !initiallyLoaded, let region = self.region, !regionWasInitiallyNil {
                mapView.region = region
            } else {
                if let userLocation = userLocation {
                    if isCenteredOnUserLocation {
                        mapView.setCenter(userLocation, animated: true)
                        isCenteredOnUserLocation = false // Reset the state variable to avoid continuous centering
                    }
                }
                self.region = mapView.region
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
            annotationView.markerTintColor = UIColor(named: "Kelly_Blue")
            
            let infoButton = UIButton(type: .infoDark)
            annotationView.rightCalloutAccessoryView = infoButton
            
            // Set custom image
            
            let image = UIImage(systemName: "leaf.fill")
            
            annotationView.glyphImage = image
            annotationView.glyphTintColor = UIColor(named: "Kelly_Green")
           
            annotationView.glyphImage = image
            
            return annotationView
        }
        
        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            self.parent.initiallyLoaded = true
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if let annotation = view.annotation,
               let location = parent.locations.first(where: { $0.coordinate.latitude == annotation.coordinate.latitude && $0.coordinate.longitude == annotation.coordinate.longitude }) {
                parent.selectedLocation = location
            }
        }
    }
}
