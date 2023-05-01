//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Griffin Michalak on 04/30/2023.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
       Location(name: "B. Good",
                tags: ["Lunch/Dinner"],
                coordinates: CLLocationCoordinate2D(latitude: 42.34007890069534, longitude: -71.09034917665868),
                website: "https://bgood.com/nutrition",
                description: "The idea came from the company’s founders: two best friends who grew up eating wholesome, flavorful, good-for-you food, lovingly cooked in their uncle’s kitchen. It was comfort food made with farm-fresh ingredients that left you feeling good inside and out (and long after you licked your plate). The same kind of food we happily serve today.",
                imageNames: ["bgood_huntington", "cloverfood"]),
       
       Location(name: "Clover Food Lab",
                tags: ["Lunch/Dinner, Vegan"],
                coordinates: CLLocationCoordinate2D(latitude: 42.372880, longitude: -71.117960),
                website: "clovercloverclover",
                description: "CloverFoodLab idk",
                imageNames: ["cloverfood"])
       
    ]
    
}
