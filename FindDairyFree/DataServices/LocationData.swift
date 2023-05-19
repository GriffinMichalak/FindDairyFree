//
//  LocationData.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/18/23.
//

import Foundation
import SwiftUI
import MapKit

class LocationData: ObservableObject {
    @Published var locations: [Location] = []

    init() {
        if let fileURL = Bundle.main.url(forResource: "Locations", withExtension: "tsv") {
            do {
                let fileContent = try String(contentsOf: fileURL)
                let rows = fileContent.components(separatedBy: .newlines)
                for row in rows {
                    let columns = row.components(separatedBy: "\t")
                    if columns.count == 8 {
                        let name = columns[0]
                        let tagsString = columns[1]
                        let address = columns[2]
                        let appleMapsLink = columns[3]
                        let latitudeString = columns[4]
                        let longitudeString = columns[5]
                        let website = columns[6]
                        let description = columns[7]
                        
                        if let latitude = Double(latitudeString), let longitude = Double(longitudeString) {
                            let tagNames = tagsString.components(separatedBy: ",")
                            var tags: [Tag] = []
                            for tagName in tagNames {
                                let tag = Tag(name: tagName.trimmingCharacters(in: .whitespacesAndNewlines))
                                tags.append(tag)
                            }
                            
                            let location = Location(name: name,
                                                    tags: tags,
                                                    address: address,
                                                    appleMapsLink: appleMapsLink,
                                                    latitude: latitude,
                                                    longitude: longitude,
                                                    coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                                                    website: website,
                                                    description: description,
                                                    imageNames: [])
                            locations.append(location)
                        }
                    }
                }
            } catch {
                print("Error reading Locations.tsv: \(error)")
            }
        } else {
            print("Locations.tsv file not found.")
        }
    }
}
