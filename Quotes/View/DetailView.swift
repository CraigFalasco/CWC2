//
//  DetailView.swift
//  Quotes
//
//  Created by Craig on 1/8/23.
//

import SwiftUI

struct QuoteDetail: View {
    
    // quote is not set because it will be set by the list view, see the comment in the Preview
    var quote:Quote
    
    var body: some View {
        ScrollView {
            Text(quote.author)
                .font(.largeTitle)
            Text(quote.bio)
            
            Image(quote.image)
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading) {
                
                Text("Quotes")
                    .font(.title)
                    .padding(.all, 10)
                
                // this ForEach gets the index (x) and uses it to put a line number on each deirection step. (x +1)
                ForEach(0..<quote.quotes.count, id: \.self) { x in
                    Text(String(x + 1) + ". " + quote.quotes[x])
                        .padding([.leading, .bottom, .trailing], 10.0)
                }
            }
        }
        .navigationBarTitle(quote.author)
    }
}
struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        // because recipe is not initialized above, we add this code only to satify the Preview, this might crash if rhe quotes array is empty.
        let x = QuoteVuModel()
        QuoteDetail(quote: x.quotes[0])
    }
}
