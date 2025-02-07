//
//  UserViewModel.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import Foundation


class UserViewModel : ObservableObject , Observable {
    
   @Published var users : [User] = []
    
    init() {
        loadFromJson()
    }
    
    func addNewUser(name: String, email: String, receiveNewsletter: Bool, age: Int, birthdate: Date, gender: String, profileImage: Data?){
        
        let newUser = User(name: name, email: email, receiveNewsletter: receiveNewsletter, age: age, birthdate: birthdate, gender: gender, profileImage: profileImage)
        users.append(newUser)
    }
    
    func loadFromJson(){
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {return}
        do {
            let dataFromFile = try Data(contentsOf: url)
            print(dataFromFile)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let listofUsersFromFile = try decoder.decode([User].self, from: dataFromFile)
            DispatchQueue.main.async {
            self.users = listofUsersFromFile
            }
        }catch {
            print("Failed to open the file: \(error)" )
        }
    }
}
