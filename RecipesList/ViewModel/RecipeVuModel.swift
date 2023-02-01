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
        
        let oldServing = recipeServings
        var newServing = Int()
        var oldNumerator = Int()
        var oldDenominator = Int()
        var newNumerator = 0
        var newDenominator = 0
        var wholeNumber = 0
        var remainder = 0
        var gcd1 = 0
        var gcd2 = 0
        var newFractionNum = 0
        var newFractionDenom = 0
        var returnText = String()
        var returnUnit = String()
        
        // the following preps for the selection of "recipe servings" from the picker
        if targetServings == 0 {
            newServing = recipeServings
        }
        else {
             newServing = targetServings
        }
        
        // if there is no numerator, then the unit is usually "to taste"
        if ingredient.num == nil {
            return ingredient.unit ?? "to taste"
        }
        else {
            oldNumerator = ingredient.num ?? 0
        }
        
        // if no denominator, default to 1
        if ingredient.denom == nil {
            oldDenominator = 1
        }
        else {
            oldDenominator = ingredient.denom ?? 1
        }
        
        // the following gives us the new ingredient amount, but as a fraction that is not reduced
        newNumerator = oldNumerator * newServing
        newDenominator = oldDenominator * oldServing
        
        // the following gets the greatest common denominator
        gcd1 = newNumerator
        gcd2 = newDenominator
        
        while gcd1 != gcd2 {
            if gcd1 > gcd2 {
                gcd1 -= gcd2
            }
            else {
                gcd2 -= gcd1
            }
        }
        // at this point gcd1 and gcd2 are equal and they contain the gcd value
        
        // reduce the fraction
        newNumerator /= gcd1
        newDenominator /= gcd1
        
        // configure the return text depending on > 1, == 1, or < 1, also, if > 1 we figure out if there is an additional fractional amount, or just a whole number
        if newNumerator > newDenominator {
            wholeNumber = newNumerator / newDenominator
            remainder = newNumerator % newDenominator
            if remainder == 0 {
                returnText = String(wholeNumber)
            }
            else {
                newFractionNum = remainder
                newFractionDenom = newDenominator
                returnText = String(wholeNumber) + " " + String(newFractionNum) + "/" + String(newFractionDenom)
            }
        }
        else if newNumerator == newDenominator {
            wholeNumber = 1
            returnText = String(wholeNumber)
        }
        else {
            returnText = String(newNumerator) + "/" + String(newDenominator)
        }
        
        if wholeNumber >= 2 && ingredient.unit != nil {
            returnUnit = (ingredient.unit ?? "unit") + "(s)"
            }
        else {
            returnUnit = (ingredient.unit ?? "")
        }
        return returnText + " " + returnUnit.lowercased()
    }
}
