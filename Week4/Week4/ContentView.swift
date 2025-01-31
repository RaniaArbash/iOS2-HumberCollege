//
//  ContentView.swift
//  Week4
//
//  Created by Rania Arbash on 2025-01-31.
//

import SwiftUI

struct ContentView: View {
    
    @State private var path = NavigationPath()
    @State private var name : String = "John Lee"
    
    var body: some View {
        NavigationStack(path: $path) {
            Text(name)
            
            NavigationLink(destination: SecondView()) {
                Text("SecondView - No Data Passed")
            }
            NavigationLink(destination: ThirdView(dataFromFirstView: "Hello Third View")) {
                Text("Third View - Passing String")
            }
            NavigationLink(destination: ForthView(nameFromFirstView: $name)) {
                Text("Forth view - Binding data")
            }
        
            NavigationLink(destination: SixthView(name: name, onSave: { newName in
                name = newName
            })) {
                Text("Sith View - Passing Clouser")
            }
            
            Button {
                path.append("go to fifth view")
                
            } label: {
                Text("Dynamic Link")
            }
        }.navigationDestination(for: String.self) { value in
                if value == "go to fifth view"{
                    FifthView()
                }
            }
    }
}

// Second View get no value passed to it
struct SecondView: View {
    var body: some View {
        Text("In Second View")
    }
}
// Third View get on string value from first view
struct ThirdView: View {
    var dataFromFirstView : String
    var body: some View {
        Text(dataFromFirstView)
    }
    
}
// Forth View will get a state string and edit it.
struct ForthView: View {
    @Binding var nameFromFirstView : String
    var body: some View {
       TextField("Enter New name", text: $nameFromFirstView)
    }
}


struct FifthView: View {
   
    var body: some View {
        Text("Fifth View")
    }
    
}

struct SixthView: View {
   
    var onSave : (String ) -> Void
    var nameFromFirstView : String

    @State private var newName : String = ""
                
    init(name :String, onSave: @escaping (String)->Void){
        self.nameFromFirstView = name
        self.onSave = onSave
        self._newName = State(initialValue: name)
     }
    
    var body: some View {
         
       TextField("Enter the name to update", text: $newName)
        Button {
            onSave(newName)
        } label: {
            Text("Save")
        }


                    
    }
    
}


