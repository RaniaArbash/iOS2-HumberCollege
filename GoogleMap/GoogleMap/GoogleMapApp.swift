//
//  GoogleMapApp.swift
//  GoogleMap
//
//  Created by Rania Arbash on 2025-03-27.
//

import SwiftUI
import GoogleMaps

@main
struct GoogleMapApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("") // Replace with your actual API key
        
        return true
    }
}
