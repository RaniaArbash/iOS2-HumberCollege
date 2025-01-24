//
//  MainView.swift
//  Week3 Project
//
//  Created by Rania Arbash on 2025-01-24.
//

import SwiftUI

struct MainView: View {
    @StateObject var myUserProfile = UserProfile(name: "John Lee", age: 25, bio: "iOS Developer")
    var body: some View {
        
        TabView{
            EditUserProfileView(userProfile: myUserProfile).tabItem { Label("Edit", systemImage : "pencil") }
            UserProfileSummeryView(userProfile: myUserProfile).tabItem { Label("Summery", systemImage: "person.circle") }
        }

    }
}
