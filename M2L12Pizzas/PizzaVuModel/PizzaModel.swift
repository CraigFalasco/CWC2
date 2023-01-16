//
//  PizzaModel.swift
//  M2L12Pizzas
//
//  Created by Craig on 1/1/23.
//

import Foundation

class PizzaModel: ObservableObject {
    
    @Published var pizzas = [Pizza]()

    init() {
        
        // Find the path to the JSON file in our bundle
        let pathString = Bundle.main.path(forResource: "Pizzas", ofType: "json")
        
        if pathString != nil {
            
            // Create a URL object with the string path to our local JSON file
            let url = URL(fileURLWithPath: pathString!)
            
            do {
                // Create data object, pointing it to our local JSON file
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                do {
                    // Try to decode the json data into instances of Pizzas
                    var jsonPizzas = try decoder.decode([Pizza].self, from: data)
                    
                    
                    // Loop through pizzas and add Ids
                    for index in 0..<jsonPizzas.count {
                        jsonPizzas[index].id = UUID()
                    }
                    
                    // Assign to pizzas property
                    self.pizzas = jsonPizzas
                }
                catch {
                    print("Couldn't parse Pizzas")
                }
                
            }
            catch {
                print("Couldn't create Data object")
            }
        }
    }
}
