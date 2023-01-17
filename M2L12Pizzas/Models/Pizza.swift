//
//  Pizza.swift
//  M2L12Pizzas
//
//  Created by Craig on 1/1/23.
//

import Foundation

struct Pizza: Identifiable, Decodable {
    
    // The id property is for the Identifiable protocol which we need to display these instances in a SwiftUI List
    var id:UUID?
    
    // These properties map to the properties in the JSON file
    var name:String
    var image:String
    var toppings:[String]
}
