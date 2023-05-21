//
//  Location.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/18/23.
//

import Foundation
import MapKit

struct Location: Identifiable, Hashable {
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
    var isFavorite: Bool
    
    // Implement the Hashable protocol by using the id property for hashing
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Implement the Equatable protocol by comparing the id property
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
}
