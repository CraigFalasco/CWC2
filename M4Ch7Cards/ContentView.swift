//
//  ContentView.swift
//  M4Ch7Cards
//
//  Created by Craig on 1/24/23.
//

import SwiftUI

struct ContentView: View {
    
        var body: some View {
            
            TabView {

                ForEach (1..<51) { x in
                    GeometryReader { geometry in
                        
                        ZStack {
                            
                            let randColor = Color(
                                red: Double.random(in: 0..<1),
                                green: Double.random(in: 0..<1),
                                blue: Double.random(in: 0..<1),
                                opacity: 0.50
                            )
                            
                            Rectangle()
                                .foregroundColor(randColor)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                            
                            Image(systemName: "\(x).circle")
                                .resizable()
                                .scaledToFit()
                                .padding()
                        }
                        .frame(height: max(geometry.size.height - 50, 100))
                    }
                }
                .padding(20)
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
