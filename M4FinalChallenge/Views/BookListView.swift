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
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            List {
                LazyVStack {
                    ForEach(model.books) { b in

                            Image(b.imageID)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 200, height: 300, alignment: .center)
                                .clipped()
                                .cornerRadius(10)
                            
                            Text(b.title + " by " + b.author)
                        
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
            .environmentObject(BookViewModel())
    }
}
