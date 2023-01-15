//
//  quoteVuModel.swift
//  Quotes
//
//  Created by Craig on 1/8/23.
//

import Foundation

class QuoteVuModel: ObservableObject {
    
    @Published var quotes = [Quote]()
    
    init() {
        
        // use the data service we created to get the json data
        let service = DataService()
        self.quotes = service.getLocalData()
        
        // you can also code it like this if you don't need to use "service" var more than once
        // self.quotes = DataService.getLocalData()
    }
}
