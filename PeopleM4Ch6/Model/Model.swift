//
//  Model.swift
//  PeopleM4Ch6
//
//  Created by Craig on 1/14/23.
//

import Foundation

class Model : ObservableObject {
    
    @Published var showName = true
    @Published var showAddress = true
    @Published var showCompany = true
    @Published var showYears = true
    
    var people = [
        Person(idNum: "A101", name: "Jane Doe", address: "123 Main St", company: "Acme Plumbing", yearsOfExperience: 3),
        Person(idNum: "A102", name: "Sam Snead", address: "202 Park Way", company: "Wilson Plumbing", yearsOfExperience: 33),
        Person(idNum: "A103", name: "John Parker", address: "333 Dove Ln", company: "CleanPipes Plumbing", yearsOfExperience: 23),
        Person(idNum: "A104", name: "Beth Brubaker", address: "484 Maple Ave", company: "ClogBeGone Plumbing", yearsOfExperience: 13),
        Person(idNum: "A105", name: "Sammt Hamlin", address: "575 Ash Circle", company: "Copper State Plumbing", yearsOfExperience: 35),
    ]
}

struct Person : Identifiable {
    var id = UUID()
    var idNum: String
    var name: String
    var address: String
    var company: String
    var yearsOfExperience: Int
}
