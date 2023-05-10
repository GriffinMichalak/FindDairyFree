//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Griffin Michalak on 04/30/2023.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static var locations = [
        Location(name: "Amelia's Taqueria",
                 tags: [],
                 address: "309 Huntington Ave, Boston, MA 02115",
                 appleMapsLink: "https://maps.apple.com/?address=309%20Huntington%20Ave,%20Boston,%20MA%20%2002115,%20United%20States&auid=9371455912701147871&ll=42.341202,-71.087660&lsp=9902&q=Amelia's%20Taqueria",
                 coordinates: CLLocationCoordinate2D(latitude: 42.34697808,
                                                     longitude: -71.0879626),
                 website: "https://www.ameliastaqueria.com/",
                 description: "There are not many options here; however, the chips and salsa or chips and guac are safe to eat. Make sure to ask the server to change their gloves first",
                 imageNames: ["cloverfood"])
    ]
}
