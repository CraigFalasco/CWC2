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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        // get single serving by multiplying the denominator by the recipe servings
        
        // get target portion by multiplying numerator by target serbings
        
        // reduce fraction using greatest common divisor
        
        // express the result as a fraction
        
        return String(targetServings)
    }
}
