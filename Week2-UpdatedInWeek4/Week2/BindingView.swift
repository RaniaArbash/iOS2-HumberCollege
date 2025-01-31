//
//  BindingView.swift
//  Week2
//
//  Created by Rania Arbash on 2025-01-17.
////
//
import SwiftUI
//
struct BindingView: View {
    // two communication between views
    @State private var isToggle = false
    
    var body: some View {
        ChildView(isOn: $isToggle).background(isToggle ?  Color.red : Color.green)
    }
}

struct ChildView : View {
    @Binding var isOn : Bool
    var body: some View {
        VStack {
            Toggle("Toggle Backgroun Color", isOn: $isOn)
            
        }.padding()
        
    }
    
}

#Preview {
    BindingView()
}
