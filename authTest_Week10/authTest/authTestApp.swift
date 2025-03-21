////
////  authTestApp.swift
////  authTest
////
////  Created by Rania Arbash on 2025-03-21.
////
//    
//    import SwiftUI
//    import FirebaseAuth
//
//    @main
//    struct authTestApp: App {
//        @StateObject var authViewModel = AuthViewModel()
//
//        var body: some Scene {
//            WindowGroup {
//                NavigationView {
//                    if authViewModel.user == nil {
//                        LoginView().environmentObject(authViewModel)
//                    } else {
//                        ChatRoomView().environmentObject(authViewModel)
//                    }
//                }
//            }
//        }
//    }
//
