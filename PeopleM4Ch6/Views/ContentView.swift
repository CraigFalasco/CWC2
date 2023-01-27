//
//  ContentView.swift
//  PeopleM4Ch6
//
//  Created by Craig on 1/14/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: Model
    
    var body: some View {
        TabView {
            
            VStack {
                Text("People")
                    .font(.title)
                    .bold()
                
                List(model.people) { person in
                    PeopleView(person: person)
                }
            }
            .tabItem { Image(systemName: "person.2.fill") }
            
            VStack {
                Text("Display Settings")
                    .font(.title)
                    .bold()
                
                Toggle("Show name:", isOn: $model.showName)
                
                Toggle("Show address:", isOn: $model.showAddress)
                
                Toggle("Show company:", isOn: $model.showCompany)
                
                Toggle("Show years of experience:", isOn: $model.showYears)
                
                Spacer()
            }
            .tabItem { Image(systemName: "gearshape") }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model())
    }
}
