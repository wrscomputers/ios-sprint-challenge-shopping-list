//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jason Hoover on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem {
    let name: String
    let addedToList: Bool
    
    var itemImage: UIImage? {
        let imageName = name
        let convertedImage = UIImage(contentsOfFile: imageName)
        return convertedImage
    }
}

