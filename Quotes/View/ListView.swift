//
//  ContentView.swift
//  Quotes
//
//  Created by Craig on 1/8/23.
//

import SwiftUI

struct ListView: View {
    
    // reference the view model
    @ObservedObject var model = QuoteVuModel()
    
    var body: some View {
            
        NavigationView {
            
            
            List(model.quotes) { q in
               
                NavigationLink(
                    destination: QuoteDetail(quote:q),
                    label: {
                    
                    HStack(spacing: 20.0) {
                        Image(q.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(q.author)
                            .font(.headline)
                    }
                })
            }
            // this is to display the recipe name in the detail veiw. Keep in mind that it will only show when switching from list to detail.
            //.navigationBarTitle("All Recipes")
        }
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
