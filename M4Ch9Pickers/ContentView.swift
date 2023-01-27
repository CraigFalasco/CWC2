//
//  ContentView.swift
//  M4Ch9Pickers
//
//  Created by Craig on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var locSelect = "0"
    @State var mealSelect = "0"
    @State var timeSelect = "0"
    
    var body: some View {
        VStack {
            
            Text("Ottimo Ristorante")
                .font(.largeTitle)
                .padding(.bottom, 50.0)
                
            
            HStack {
                Text("Location")
                Picker("Location", selection: $locSelect, content: {
                    Text("Chandler").tag("1")
                    Text("Mesa").tag("2")
                    Text("Phoenix").tag("3")
                    Text("Tempe").tag("4")
                    Text("Flagstaff").tag("5")
                })
                .pickerStyle(.menu)
            }
            .padding(10.0)
            
            HStack {
                Text("Order")
                Picker("Order", selection: $mealSelect, content: {
                    Text("Lunch box").tag("1")
                    Text("Salad").tag("2")
                    Text("Soup & half-sandwich").tag("3")
                    Text("Hamburger").tag("4")
                    Text("Tofu stir fry").tag("5")
                })
                .pickerStyle(.wheel)
            }
            .padding(40.0)
            .padding(.leading, 20.0)
            
            HStack {
                Text("Pickup Time")
                Picker("Pickup time", selection: $timeSelect, content: {
                    Text("5 pm").tag("1")
                    Text("6 pm").tag("2")
                    Text("7 pm").tag("3")
                    Text("8 pm").tag("4")
                    Text("9 pm").tag("5")
                })
                .pickerStyle(.segmented)
            }
            .padding(40.0)
            .padding(.leading, 20.0)
            
            
            
            Button("Pick for me!", action: {
                let randLoc = Int.random(in: 1...5)
                locSelect = String(randLoc)
                let randMeal = Int.random(in: 1...5)
                mealSelect = String(randMeal)
                let randTime = Int.random(in: 1...5)
                timeSelect = String(randTime)
                
            })
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
