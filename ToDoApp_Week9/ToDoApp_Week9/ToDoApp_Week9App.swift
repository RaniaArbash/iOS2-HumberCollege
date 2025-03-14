//
//  ToDoApp_Week9App.swift
//  ToDoApp_Week9
//
//  Created by Rania Arbash on 2025-03-14.
//

import SwiftUI

@main
struct ToDoApp_Week9App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
