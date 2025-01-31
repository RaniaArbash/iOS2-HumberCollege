//
//  AnimationUI.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-24.
//

import SwiftUI

struct AnimationExample: View {
    @State private var isToggled = false // State variable to drive the animation

    var body: some View {
        VStack {
            // Circle with animations
            Circle()
                .fill(isToggled ? Color.blue : Color.red) // Animate color change
                .frame(width: isToggled ? 150 : 100, height: isToggled ? 150 : 100) // Animate size change
                .rotationEffect(.degrees(isToggled ? 360 : 0)).opacity(isToggled ? 0.5 : 1) // Animate rotation
                .animation(.spring(response: 0.8, dampingFraction: 0.8), value: isToggled)

            // Button to toggle the state
            Button("Toggle Animation") {
                isToggled.toggle() // Triggers the animation
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}


#Preview {
    AnimationExample()
}
