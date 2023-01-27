//
//  ContentView.swift
//  M4Ch9Pickers
//
//  Created by Craig on 1/26/23.
//

import SwiftUI

struct ContentView: View {
    
    var locArray = ["Chandler", "Tempe", "Mesa", "Phoenix", "Flagstaff", "Venus", "Mars"]
    var ordArray = ["Lunch box", "Hamburger", "Pizza", "Tofu stir fry", "Salad", "Soup & sandwich"]
    
    @State var currentDate = Date()
    @State var locSelect = 0
    @State var mealSelect = 0
    @State var timeSelect = "0"
    
    var body: some View {
        VStack {
            
            Text("Ottimo Ristorante")
                .font(.largeTitle)
                .padding(.bottom, 50.0)
            
            // ISSUE: The first parm in Picker (label?) will not display, so the Text element had to be added
            HStack {
                Text("Location")
                Picker("Location", selection: $locSelect, content:
                {
                    ForEach(0..<locArray.count, id: \.self) { l in
                        Text(locArray[l])
                    }
                })
                .pickerStyle(.menu)
            }
            .padding(10.0)
            
            HStack {
                Text("Order")
                Picker("Order", selection: $mealSelect, content:
                {
                    ForEach (0..<ordArray.count, id: \.self) { o in
                        Text(ordArray[o])
                    }
                })
                .pickerStyle(.wheel)
            }
            .padding(40.0)
            .padding(.leading, 20.0)
            
            VStack {
                Button("Pick for me!", action: {
                    let randLoc = Int.random(in: 0..<locArray.count)
                    locSelect = randLoc
                    let randMeal = Int.random(in: 0..<ordArray.count)
                    mealSelect = randMeal
                    // let randTime = Int.random(in: 1...5)
                    // timeSelect = String(randTime)
                    
                })
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.purple/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            }
            .padding(40)
            
            DatePicker(
                "Pickup time",
                selection: $currentDate,
                displayedComponents: .hourAndMinute
            )
        }
        .padding(40.0)
        .padding(.leading, 20.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
