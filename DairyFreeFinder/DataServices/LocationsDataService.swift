//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Griffin Michalak on 04/30/2023.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static var locations = [Location]()
    
    init() {
        LocationsDataService.locations = convertTSVIntoArray()
    }

    func convertTSVIntoArray() -> [Location] {

        //locate the file you want to use
        guard let filepath = Bundle.main.path(forResource: "data", ofType: "tsv") else {
            return []
        }

        //convert that file into one long string
        var data = ""
        do {
            data = try String(contentsOfFile: filepath)
        } catch {
            print(error)
            return []
        }

        //now split that string into an array of "rows" of data.  Each row is a string.
        var rows = data.components(separatedBy: "\n")

        //if you have a header row, remove it here
        rows.removeFirst()

        //now loop around each row, and split it into each of its columns
        for row in rows {
            let columns = row.components(separatedBy: "\t")

            //check that we have enough columns
            if columns.count == 8 {
                let name = columns[0]
                let tags = columns[1]
                let address = columns[2]
                let appleMapsLink = columns[3]
                let latitude = Double(columns[4]) ?? 0
                let longitude = Double(columns[5]) ?? 0
                let website = columns[6]
                let description = columns[7]

                let loc = Location(name: name, tags: [], address: address, appleMapsLink: appleMapsLink, coordinates: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), website: website, description: description, imageNames: ["cloverfood"])
                
                LocationsDataService.locations.append(loc)
            }
        }
        return LocationsDataService.locations
    }

    
}
