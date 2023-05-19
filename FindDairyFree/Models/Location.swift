//
//  Location.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/18/23.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    var tags: [Tag]
    let address: String
    let appleMapsLink: String
    let latitude: Double
    let longitude: Double
    let coordinate: CLLocationCoordinate2D
    let website: String
    let description: String
    let imageNames: [String]
}
