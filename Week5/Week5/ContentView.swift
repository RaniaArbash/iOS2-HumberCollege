//
//  ContentView.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import SwiftUI

struct UsersListView: View {
    
   @EnvironmentObject var usersVM : UserViewModel
    
    var body: some View {
        ZStack {
            List(usersVM.users) { user in
                HStack{
                    if let profileImage = user.profileImage {
                        Image(uiImage: UIImage(data:profileImage)!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(user.name).font(.headline)
                        Text(user.email).font(.subheadline)
                        Text("Age: \(user.age)")
                        Text("Gender: \(user.gender)")
                    }
                }
            }.navigationTitle("User List")
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: 60, height: 60)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                }
            }
        }
    }
}
