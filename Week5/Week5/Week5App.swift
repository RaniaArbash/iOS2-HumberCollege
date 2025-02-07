//
//  Week5App.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import SwiftUI

@main
struct Week5App: App {
    var body: some Scene {
        WindowGroup {
            UsersListView().environment(UserViewModel())
        }
    }
}
