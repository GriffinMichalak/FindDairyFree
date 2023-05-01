//
//  Location.swift
//  DairyFreeFinder
//
//  Created by Griffin Michalak on 4/30/23.
//

import Foundation
import MapKit

/**
 Represents a Location Object.
 */

struct Location: Identifiable, Equatable {
    
    let name: String
    var tags: [String]
    let coordinates: CLLocationCoordinate2D
    let website: String
    let description: String
    let imageNames: [String]
    
    var id: String {
        name + website
    }
    
    /**
     Equatable, determines if two locations have the same. (i.e. the have the same ID)
     */
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
    
}
