//
//  TagData.swift
//  FindDairyFree
//
//  Created by Griffin Michalak on 5/21/23.
//

import Foundation
struct TagData {
    
    let name: String
    let description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
    
    func getDescription() -> String {
        return description
    }
}
