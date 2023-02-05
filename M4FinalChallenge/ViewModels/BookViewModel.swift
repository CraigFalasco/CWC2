//
//  BookViewModel.swift
//  M4FinalChallenge
//
//  Created by Craig on 2/4/23.
//

import Foundation

class BookViewModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        // use the data service we created to get the json data
        let service = DataService()
        self.books = service.getLocalData()
        
        // you can also code it like this if you don't need to use "service" var more than once
        // self.recipes = DataService.getLocalData()
    }
}
