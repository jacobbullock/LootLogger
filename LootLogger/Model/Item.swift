//
//  Item.swift
//  LootLogger
//
//  Created by jacob on 8/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation

class Item: Codable, Identifiable {
    var name = ""
    var serial = ""
    var itemValue = ""
    let id = UUID()
    
    init(name: String, serial: String, itemValue: String) {
        self.name = name
        self.serial = serial
        self.itemValue = itemValue
    }

    static var random: Item {
        let name = ["Banana", "Hat", "Sticker"].randomElement() ?? ""
        let serial = String(UUID().uuidString.prefix(10))
        let value = String((0..<100).randomElement() ?? 0)
        return Item(name: name, serial: serial, itemValue: value)
    }
    
    static var new: Item {
        let name = "New Item"
        let serial = String(UUID().uuidString.prefix(10))
        let value = "0"
        return Item(name: name, serial: serial, itemValue: value)
    }
}
