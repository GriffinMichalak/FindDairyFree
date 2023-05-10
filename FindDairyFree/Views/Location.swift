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
    var tags: [Tag]
    let address: String
    let appleMapsLink: String
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
    
    /**
     Converts an address, as a String, into a coordinate.
     Credit: https://developer.apple.com/documentation/corelocation/converting_between_coordinates_and_user-friendly_place_names
     */
    
    func getCoordinate( addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                        
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
                
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    
}
