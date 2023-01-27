//
//  DataService.swift
//  RecipesList
//
//  Created by Craig on 1/2/23.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe] {
       
        // parse local json file
        
        // get url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        // check if pathString is not nil, else return an empty array
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        // create a data object, use do try catch in case url is nil
        do {
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder, use do try catch again
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                
                // return the recippes
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        // return an empty array if we get to this point because this is after catching the error in getting the url
        return[Recipe]()
    }
}
