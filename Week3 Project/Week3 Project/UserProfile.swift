//
//  UserProfile.swift
//  Week3 Project
//
//  Created by Rania Arbash on 2025-01-24.
//

import Foundation

class UserProfile : ObservableObject {
    var id = UUID()
   @Published var name: String
    @Published  var age: Int
    @Published var bio : String
    

    init(name: String, age: Int, bio: String) {
        self.name = name
        self.age = age
        self.bio = bio
    }
}

class ProfileViewModel : ObservableObject {
    //var profile = UserProfile(name: "John Lee", age: 25, bio: "iOS Developer")
    
    //edit
    // save to database
    // get from an API
    // delete
    
}
