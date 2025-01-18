//
//  ContentView.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-17.
//

import SwiftUI

struct StateView: View {
   @State private var counter = 0
    var body: some View {
        VStack {
            Text("Counter \(counter)")
            HStack(alignment: .top) {
                Button("++"){
                    counter += 1
                }
                Button("--"){
                    counter -= 1
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    StateView()
}
