//
//  ContentView.swift
//  Week1
//
//  Created by Rania Arbash on 2025-01-10.
//

import SwiftUI



struct ProfileCard: View {
    let imageName: String
    let name: String
    let bio : String

    var body: some View {
        VStack {
            Image(imageName).resizable()
                .scaledToFill()
                .frame(width: 100, height: 100).clipShape(Circle())
                .shadow(radius: 5)
            
            Text(name).font(.title2).fontWeight(.bold).foregroundColor(.primary)
            
            Text(bio)
                .font(.subheadline)
                .foregroundColor(.secondary).multilineTextAlignment(.center).padding(.horizontal,10)
            
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct ContentView: View {
    
    let profiles = [
        ("profile1", "Alice Johnson", "UI/UX Designer | Coffee Lover"),
        ("profile2", "Bob Smith", "iOS Developer | Swift Guru"),
        ("profile3", "Charlie Brown", "Tech Enthusiast | Blogger"),
        ("profile4", "Dana White", "Mobile App Designer | Traveler")
    ]

    var lazygridColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
                 ]
    
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: lazygridColumns,
                content: {
                    ForEach(profiles , id: \.1) { profile in
                        
                        ProfileCard(imageName: profile.0, name: profile.1, bio: profile.2)
                    }
                    
                }).padding()
        }.background(Color.gray.opacity(0.1))
        
    }
}

#Preview {
    ContentView()
}
