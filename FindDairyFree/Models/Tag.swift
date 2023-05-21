//
//  Tag.swift
//  Test
//
//  Created by Griffin Michalak on 5/18/23.
//

import Foundation

struct Tag: Hashable {
    let id = UUID()
    let name: String

    init(name: String) {
        self.name = name
    }
}
