//
//  ContentView.swift
//  Week7
//
//  Created by Rania Arbash on 2025-02-21.
//

import SwiftUI

struct ContentView: View {
   @State var image : UIImage?
    @State private var showCamera = false
    
    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(10)
            } else {
                Text("No Image Captured")
                    .foregroundColor(.gray)
            }
            
            Button("Open Camera") {
                showCamera = true
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .sheet(isPresented: $showCamera) {
            CameraView(image: $image)
        }
    }
    
}
