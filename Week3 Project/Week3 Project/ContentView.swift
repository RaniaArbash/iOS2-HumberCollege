//
//  ContentView.swift
//  Week3 Project
//
//  Created by Rania Arbash on 2025-01-24.
//

import SwiftUI

struct EditUserProfileView: View {
    @ObservedObject var userProfile : UserProfile
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Edit Profile Information").font(.largeTitle)
                TextField("User Name", text: $userProfile.name)
                Stepper("Age \(userProfile.age)", value: $userProfile.age,in: 0...100)
                TextField("Bio", text: $userProfile.bio)
            }
            .padding()
        }
    }
}

struct UserProfileSummeryView: View {
    @ObservedObject var userProfile : UserProfile
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Profile Information Summery").font(.largeTitle)
                Text("\(userProfile.name)")
                Text("\(userProfile.age)" )
                Text("\(userProfile.bio)" )
            }
            .padding()
        }
    }
}




//
//#Preview {
//    EditUserProfileView(userProfile: UserProfile(name: "SMith", age: 40, bio: "C++ Developer"))
//}
