//
//  Animation.swift
//  Week3 Project
//
//  Created by Rania Arbash on 2025-01-24.
//

import SwiftUI

struct Animation: View {
    
  @State private var withAnimation = false
    
    var body: some View {
        VStack{
            Circle().fill(withAnimation ? Color.red : Color.green).frame(width: 100, height: 100).scaleEffect(withAnimation ? 2 : 1).animation(.easeIn, value: withAnimation).opacity(withAnimation ? 1 : 0.5)
           
            
            Button("Toggle Animation"){
                withAnimation = !withAnimation
            }
        }
    }
}

#Preview {
    Animation()
}
