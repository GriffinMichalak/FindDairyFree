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
    
    /**
     Returns all tags as a list in the form of a String.
     Example: if tags = [.bakery, .vegan] then the return is "Bakery, Vegan"
     */
    public func tagsToString() -> String {
        let tagStrings = tags.map { $0.stringValue }
        return tagStrings.joined(separator: ", ")
    }

}
