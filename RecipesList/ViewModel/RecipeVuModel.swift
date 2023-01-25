//
//  RecipeVuModel.swift
//  RecipesList
//
//  Created by Craig on 1/2/23.
//

import Foundation

class RecipeVuModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // use the data service we created to get the json data
        let service = DataService()
        self.recipes = service.getLocalData()
        
        // you can also code it like this if you don't need to use "service" var more than once
        // self.recipes = DataService.getLocalData()
    }
}
