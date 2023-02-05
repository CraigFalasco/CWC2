//
//  Books.swift
//  M4FinalChallenge
//
//  Created by Craig on 2/4/23.
//

import Foundation
class Book: Identifiable, Decodable {
    
    var id:UUID?
    var title:String
    var author:String
    var isFavorite:Bool
    var currentPage:Int
    var rating:Int
    var imageID:String
    var content:[String]
        
}
