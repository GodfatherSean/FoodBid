//
//  ToDoItem.swift
//  Todo
//
//  Copyright © 2016 YiGu. All rights reserved.
//

import Foundation

class Dish {
    var id: String
    var image: String
    var title: String
    var price: Double
    var originalPrice: Double
  
    init(id: String, image: String, title: String, price: Double) {
        self.id = id
        self.image = image
        self.title = title
        self.price = price
        self.originalPrice = price + 3.0
    }
}
