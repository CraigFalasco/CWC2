//
//  ContentView.swift
//  RandomGenerator - like a password generator
//
//  Created by Craig on 12/30/22.
//

import SwiftUI
let randomChars = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","p","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","#","$","&","-","?"]
let maxChar = 15
struct ContentView: View {
    
    @State var result = ""
    
    var body: some View {
        ZStack {
            Image("winterScene")
            VStack {
                
                Text(result)
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                
                Button("GET RANDOM STRING") {
                    result = getResult()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
                
                Button("CLEAR") {
                    result = ""
                }
                .padding(/*@START_MENU_TOKEN@*/.all, 15.0/*@END_MENU_TOKEN@*/)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.red/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                
                
                
            }
        }
    }
    
    func getResult() -> String {
        var resultArray = [""]
        var r = 0
        var rand1 = 0
        
        /*
         Force 1st char to be a - z, no numerals or spec chars.
         Force an uppercase in pos 5, 10.
         Force a spec char in pos 8 so there is at least one spec char.
         Remeber, pos 1 is array index 0, etc.
         */
        
        while r < maxChar {
            if r == 0 {
                rand1 = Int.random(in: 0...23)
                resultArray.append(randomChars[rand1])
            }
            else if r == 4  ||
                        r == 9
            {
                rand1 = Int.random(in: 0...23)
                resultArray.append(randomChars[rand1].uppercased())
            }
            else if r == 7 {
                rand1 = Int.random(in: 33...37)
                resultArray.append(randomChars[rand1])
            }
            else {
                rand1 = Int.random(in: 0...randomChars.count - 1)
                resultArray.append(randomChars[rand1])
            }
            r += 1
        }
        return resultArray.joined(separator: "")
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
