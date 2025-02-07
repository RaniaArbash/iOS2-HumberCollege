//
//  UserModel.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import Foundation

struct User : Identifiable, Codable {
        let id: UUID
       let name: String
       let email: String
       let receiveNewsletter: Bool
       let age: Int
       let birthdate: Date
       let gender: String
       let profileImage: Data?
    
    init(id: UUID = UUID(), name: String, email: String, receiveNewsletter: Bool, age: Int, birthdate: Date, gender: String, profileImage: Data?) {
        self.id = id
        self.name = name
        self.email = email
        self.receiveNewsletter = receiveNewsletter
        self.age = age
        self.birthdate = birthdate
        self.gender = gender
        self.profileImage = profileImage
    }
}
