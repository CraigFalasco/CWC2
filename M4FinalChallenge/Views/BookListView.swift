//
//  ContentView.swift
//  M4FinalChallenge
//
//  Created by Craig on 2/3/23.
//

import SwiftUI

struct BookListView: View {
    
    @EnvironmentObject var model:BookViewModel
    
    var body: some View {
        VStack {
            
            Text("My Library")
            
            ScrollView {
                LazyVStack {
                    ForEach(model.books) { b in
                        
                        HStack(spacing: 20.0) {
                            
                            Image(b.imageID)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75, alignment: .center)
                                .clipped()
                                .cornerRadius(10)
                            
                            Text(b.title + " by " + b.author)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookViewModel())
    }
}
