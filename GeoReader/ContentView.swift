//
//  ContentView.swift
//  GeoReader
//
//  Created by Craig on 1/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           
            ZStack {
                
                GeometryReader { geo1 in
                    
                    Rectangle()
                    
                        .foregroundColor(.green)
                    
                        .onTapGesture {
                            print("Green x: \(geo1.frame(in: .local).midX) , y: \(geo1.frame(in: .local).midY)")
                        }
                }
                
                GeometryReader { geo1 in
                    
                    Rectangle()
                    
                        .frame(width: geo1.size.width * 2 / 3, height: geo1.size.height * 0.25)
                    
                        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
                        .padding(.leading, geo1.size.width / 6)
                        .padding(.top, geo1.size.height * 0.375)
                    
                        .onTapGesture {
                            print("Red x: \(geo1.frame(in: .local).midX) , y: \(geo1.frame(in: .local).midY)")
                            
                        }
                }
            }
            
            Spacer(minLength: 0)
  
                HStack {
                    
                    GeometryReader { geo2 in
                        
                        Rectangle()
                        
                            .foregroundColor(/*@START_MENU_TOKEN@*/.purple/*@END_MENU_TOKEN@*/)
 
                            .onTapGesture {
                                print("Purple x: \(geo2.frame(in: .global).midX) , y: \(geo2.frame(in: .local).midY)")

                            }
                    }
                    
                    Spacer(minLength: 0)
                    
                    GeometryReader { geo2 in
  
                        Rectangle()
                        
                            .foregroundColor(/*@START_MENU_TOKEN@*/.orange/*@END_MENU_TOKEN@*/)
  
                            .onTapGesture {
                            
                                print("Orange x: \(geo2.frame(in: .global).midX) , y: \(geo2.frame(in: .local).midY)")
                        }
                }
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
