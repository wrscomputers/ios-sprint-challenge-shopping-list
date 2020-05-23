//
//  ShoppingListCollectionViewController.swift
//  Shopping List
//
//  Created by Jason Hoover on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListCollectionViewController: UICollectionViewController {
    
    let design = ShoppingListViewCell()
    
    let shopping = ShoppingList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopping.createItem()
        
        
        }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderScreen" {
            guard let placeOrderVC = segue.destination as? ShoppingListCollectionViewController else {
                return
            }
        }
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return shopping.inventory.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoppingItems", for: indexPath) as? ShoppingListViewCell else {fatalError("Collection view cell identifier is wrong or the cell is not a PlanetCollectionViewCell")
            
        }
        
        // Configure the cell
        let selectableItem = shopping.inventory[indexPath.item]
        cell.imageView.image = selectableItem.itemImage!
        cell.nameLabel.text = selectableItem.name
        
        switch selectableItem.addedToList {
        case true:
            cell.cartLabel.text = "Added"
        default:
            cell.cartLabel.text = "Not Added"
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var itemForPurchase = shopping.inventory[indexPath.item]
        
        itemForPurchase.addedToList.toggle()
        
        switch itemForPurchase.addedToList {
               case true:
                   design.cartLabel.text = "Added"
               default:
                   design.cartLabel.text = "Not Added"
               }
        
        
        
    }
}
