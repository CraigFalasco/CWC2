//
//  ContentView.swift
//  M4Ch8Cards
//
//  Created by Craig on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach (1..<51) { x in
                    Rectangle()
                        .fill(RadialGradient(
                            colors: ([.teal, .blue]),
                            center: UnitPoint(x: 0.5, y: 0.5),
                            startRadius: 0,
                            endRadius: 200))
                        .frame(height: pow(1.1, CGFloat(x)))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
