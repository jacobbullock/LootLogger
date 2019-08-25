//
//  ItemStore.swift
//  LootLogger
//
//  Created by jacob on 8/25/19.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import Foundation
import Combine

class ItemStore: ObservableObject {
    @Published var items: [Item] = []
    
    var dataStoreURL: URL {
        let directories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let url = directories.first!.appendingPathComponent("items.plist")
        return url
    }
    
    init() {
        do {
            let data = try Data(contentsOf: dataStoreURL)
            let decoder = PropertyListDecoder()
            let items = try decoder.decode([Item].self, from: data)
            self.items = items
        } catch {
            print("error: \(error)")
        }
    }

    func addItem(_ item: Item) {
        items.append(item)
        save()
    }
    
    func save() {
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(self.items)
            try data.write(to: dataStoreURL)
        } catch {
            print("error: \(error)")
        }

    }
}
