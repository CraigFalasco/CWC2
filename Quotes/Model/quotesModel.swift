//
//  quotesModel.swift
//  Quotes
//
//  Created by Craig on 1/8/23.
//

import Foundation

class Quote: Identifiable, Decodable {
    
    // The id property is for the Identifiable protocol which we need to display these instances in a SwiftUI List
    var id:UUID?
    
    // These properties map to the properties in the JSON file
    var author:String
    var bio:String
    var image:String
    var quotes:[String]
}
