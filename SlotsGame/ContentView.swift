//
//  ContentView.swift
//  SlotsGame
//
//  Created by Craig on 12/14/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var creditCount = 1000
    @State private var leftFruit = ("fruit1")
    @State private var middleFruit = ("fruit2")
    @State private var rightFruit = ("fruit3")
    
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
            Spacer()
            HStack {
                Text("Credits")
                    .font(.title)
                Text(String(creditCount))
                    .font(.largeTitle)
            }
            Spacer()
            HStack {
                
                Image(leftFruit)
                
                Image(middleFruit)
                
                Image(rightFruit)
                
            }
            Spacer()
            Button(action: {
                
                // random number between 1 and 3 to match with images of fruit1, 2, and 3
                
                let leftFruitRand = Int.random(in: 1...3)
                let middleFruitRand = Int.random(in: 1...3)
                let rightFruitRand = Int.random(in: 1...3)
                
                
                // update the 3 images with the associated fruit from the random numbers
                
                leftFruit = "fruit" + String(leftFruitRand)
                middleFruit = "fruit" + String(middleFruitRand)
                rightFruit = "fruit" + String(rightFruitRand)
                
                // update creadit counter
                
                if leftFruitRand == middleFruitRand &&
                    leftFruitRand == rightFruitRand {
                    creditCount += 90
                }
                else {
                    creditCount -= 10
                }
            }
                   , label: {
                Text("Spin")
                    .font(.largeTitle)
                    
            })
            Spacer()
            
            // reset button
            
            Button(action: {
                leftFruit = "fruit1"
                middleFruit = "fruit2"
                rightFruit = "fruit3"
                creditCount = 1000
                
            }, label: {
                Text("RESET").font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.red)
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .italic()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
