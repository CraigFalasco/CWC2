//
//  ContentView.swift
//  M2L15Pizzas with images
//

//  Created by Craig on 1/1/23.
//

import SwiftUI

struct PizzaView: View {
    @ObservedObject var model = PizzaModel()
        
    var body: some View {
/*
 Replaced the List with ScrollView and ForEach
 List(model.pizzas) { item in
 */
        
        ScrollView {
            VStack(alignment: .leading) {
                ForEach (model.pizzas) { item in
                    
                    HStack {
                        Image(item.image)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: 50.0, height: 50.0)
                            .clipped()
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.title2)
                            HStack {
/*
 replaced the hard-coded Text and toppings with ForEach - can't use a while or for loop in a View - with ForEach we don't have to worry about how many items there are in the array.
 */
                                ForEach (item.toppings, id: \.self) { topping in
                                    Text(topping)
                                                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaView()
    }
}
