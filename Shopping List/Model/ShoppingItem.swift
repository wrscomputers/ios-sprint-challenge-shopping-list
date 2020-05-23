//
//  ShoppingItem.swift
//  Shopping List
//
//  Created by Jason Hoover on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

struct ShoppingItem: Codable {
    let name: String
    var addedToList: Bool = false
    var itemImage: UIImage? {
//        let imageName = name
        let convertedImage = UIImage(named: name)
        return convertedImage
    }
}

