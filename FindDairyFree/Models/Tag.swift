//
//  Tag.swift
//  Test
//
//  Created by Griffin Michalak on 5/18/23.
//

import Foundation

enum Tag: String {
    case bakery = "Bakery"
    case bbq = "BBQ"
    case breakfast = "Breakfast"
    case burger = "Burger"
    case cafe = "Cafe"
    case dessert = "Dessert"
    case drink = "Drink"
    case greek = "Greek"
    case grill = "Grill"
    case healthy = "Healthy"
    case icecream = "Ice Cream"
    case japanese = "Japanese"
    case lunch_dinner = "Lunch/Dinner"
    case mexican = "Mexican"
    case pizza = "Pizza"
    case plant_based = "Plant-Based"
    case pretzel = "Pretzel"
    case ramen = "Ramen"
    case sandwich = "Sandwich"
    case spanish = "Spanish"
    case star = "Star"
    case thai = "Thai"
    case top9 = "Top 9"
    case vegan = "Vegan"
    case vietnamese = "Vietnamese"
    
    var stringValue: String {
        return rawValue
    }
    
    static func fromString(_ string: String) -> [Tag] {
        let tagStrings = string.components(separatedBy: ",")
        var tags: [Tag] = []
        for tagString in tagStrings {
            if let tag = Tag(rawValue: tagString.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()) {
                tags.append(tag)
            }
        }
        return tags
    }

}
