//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Jason Hoover on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingList {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var inventory: [ShoppingItem] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createItem() {
        for x in itemNames {
            let newItem = ShoppingItem(name: x)
            inventory.append(newItem)
            
            
            saveToPersistanceStore()
        }
    }
    
    //MARK: - Persistence
    var persistentFileURL: URL? {
        let fileManager = FileManager.default
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        let itemsURL = documentsDir?.appendingPathComponent("items.plist")
        return itemsURL
    }
    
    func saveToPersistanceStore() {
        do {
            guard let persistentFileURL = persistentFileURL else {return}
            let encoder = PropertyListEncoder()
            let itemsPlist = try encoder.encode(inventory)
            try itemsPlist.write(to: persistentFileURL)
        } catch {
            print("Error saving items: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            guard let persistentFileURL = persistentFileURL else { return }
            let itemsPlist = try Data(contentsOf: persistentFileURL)
            let decoder = PropertyListDecoder()
            let decodeditems = try decoder.decode([ShoppingItem].self, from: itemsPlist)
            self.inventory = decodeditems
        } catch {
            print("Error loading items from plist: \(error)")
        }
    }
}



