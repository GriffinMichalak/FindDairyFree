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
    
    @Published var infoTags: [TagData] = [
        TagData(name: "Bakery 🍞", description: "Location contains bakery items. Note that cross-contamination is more common here."),
        TagData(name: "BBQ", description: "Barbecue/Grill options available"),
        TagData(name: "Breakfast 🥞", description: "Serves breakfast food like eggs, toast, etc. Note that this may be time-sensitive."),
        TagData(name: "Burger 🍔", description: "Serves burgers"),
        TagData(name: "Cafe ☕️", description: "Serves coffee/tea in a cafe setting"),
        TagData(name: "Dessert 🍰", description: "Serves dessert or bakery items"),
        TagData(name: "Drink 🧉", description: "Serves beverages"),
        TagData(name: "Greek 🇬🇷", description: "Serves Greek food."),
        TagData(name: "Grill 🍔", description: "Barbecue/Grill options available"),
        TagData(name: "Healthy 🍎", description: "See tag"),
        TagData(name: "Ice Cream 🍦", description: "See tag"),
        TagData(name: "Japanese 🇯🇵", description: "See tag"),
        TagData(name: "Lunch/Dinner ☀️🌙", description: "Lunch and Dinner options available"),
        TagData(name: "Mexican 🇲🇽", description: "See tag"),
        TagData(name: "Pizza 🍕", description: "See tag"),
        TagData(name: "Plant-Based 🌱", description: "Restaurant has plant-based options available"),
        TagData(name: "Pretzel 🥨", description: "See tag"),
        TagData(name: "Ramen 🍜", description: "See tag"),
        TagData(name: "Sandwich 🥪", description: "See tag"),
        TagData(name: "Spanish 🇪🇸", description: "See tag"),
        TagData(name: "Star ⭐️", description: "Restaurant is either dairy-free, has a dairy-free menu, has dairy-free labels on their menu(s), or lists top allergens with menu items. (At the time of our last review.)"),
        TagData(name: "Thai", description: "See tag"),
        TagData(name: "Top-9 🤗", description: "Restaurant contains items that are free from the top 9 most common allergens: milk, eggs, nuts, fish, crustaceans, shellfish, wheat, soy and sesame"),
        TagData(name: "Vegan 🍃", description: "All items in location are 100% vegan"),
        TagData(name: "Vietnamese", description: "See tag")
    ]

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
                            let uniqueTagNames = Set(tagNames.map { $0.trimmingCharacters(in: .whitespacesAndNewlines) })
                            let tags = uniqueTagNames.map { Tag(name: $0) }
                            
                            let location = Location(name: name,
                                                    tags: tags,
                                                    address: address,
                                                    appleMapsLink: appleMapsLink,
                                                    latitude: latitude,
                                                    longitude: longitude,
                                                    coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                                                    website: website,
                                                    description: description,
                                                    imageNames: [],
                                                    isFavorite: false)
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
    
    /**
     Returns a tag with a given name.
     */
    func getTagWithName(name: String) -> TagData {
        if let tag = infoTags.first(where: { $0.name == name }) {
            return tag
        }
        
        return TagData(name: "", description: "")
    }
    
    public func addTag(tag: TagData) {
        infoTags.append(tag)
    }
    
    public func removeTag() {
        
    }
    
    func getFavorites() -> [Location] {
        var favoriteLocations = [Location]()
        for location in locations {
            if location.isFavorite {
                favoriteLocations.append(location)
            }
        }
        return favoriteLocations
    }
    
    func toggleFavorite(location: Location) {
            if let index = locations.firstIndex(where: { $0.id == location.id }) {
                locations[index].isFavorite.toggle()
            }
        }

}
