//
//  People.swift
//  PeopleM4Ch6
//
//  Created by Craig on 1/14/23.
//

import SwiftUI

struct PeopleView: View {
    
    @EnvironmentObject var model: Model
    var person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("ID Number: \(person.idNum)")
            
            if model.showName {
                Text("Name: \(person.name)")
            }
            
            if model.showAddress {
                Text("Address: \(person.address)")
            }
            
            if model.showCompany {
                Text("Company: \(person.company)")
            }
            
            if model.showYears {
                Text("Years of Experience: \(person.yearsOfExperience)")
            }
        
        }
    }
}

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleView(person: Person(
            idNum: "Z999",
            name: "Mamma Mia",
            address: "123 Candy Lane",
            company: "CodeWithChris",
            yearsOfExperience: 99
        )).environmentObject(Model())
    }
}
