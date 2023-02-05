//
//  DataService.swift
//  M4FinalChallenge
//
//  Created by Craig on 2/4/23.
//

import Foundation

class DataService {
    
    // parse local json file
    
    func getLocalData() -> [Book] {
        
        // get url path to the json file
        let pathString = Bundle.main.path(forResource: "books", ofType: "json")
        
        // check if pathString is not nil, else return an empty array
        guard pathString != nil else {
            return [Book]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        // create a data object, use do try catch in case url is nil
        do {
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder, use do try catch again
            let decoder = JSONDecoder()
            do {
                let bookData = try decoder.decode([Book].self, from: data)
                
                // add the unique IDs
                for b in bookData {
                    b.id = UUID()
                }
                
                // return the books
                return bookData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        // return an empty array if we get to this point because this is after catching the error in getting the url
        return[Book]()
    }
}
