//
//  AuthViewModel.swift
//  authTest
//
//  Created by Rania Arbash on 2025-03-21.
//

import FirebaseAuth
import FirebaseFirestore
import Combine

struct UserModel: Identifiable {
    var id: String
    var name: String
    var email: String
}


class AuthViewModel: ObservableObject {
    @Published var user: UserModel?// the only place where we have the user object
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    
    
    private var cancellables = Set<AnyCancellable>()
    
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        // Observe authentication state using Firebase's addStateDidChangeListener
        authStateListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            self?.fetchUser() // Fetch user data whenever authentication state changes
        }
    }
    
    // Function to fetch user data from Firestore after login
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        isLoading = true
        
        Firestore.firestore().collection("users").document(userId).getDocument { [weak self] snapshot, error in
            self?.isLoading = false
            if let error = error {
                self?.errorMessage = "Error fetching user data: \(error.localizedDescription)"
                return
            }
            guard let data = snapshot?.data() else {
                self?.errorMessage = "No user data found"
                return
            }
            
            self?.user = UserModel(
                id: userId,
                name: data["name"] as? String ?? "",
                email: data["email"] as? String ?? ""
            )
        }
    }
    // Function to sign out
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            self.errorMessage = "Error signing out: \(error.localizedDescription)"
        }
    }
    // Function to sign in with email and password
    func signIn(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            self.isLoading = false
            if let error = error {
                completion(false, error.localizedDescription)
                return
            }
            self.fetchUser()
            completion(true, nil)
        }
    }

    // Function to create a new user with email and password
    func signUp(name: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            self.isLoading = false
            if let error = error {
                print(error)
                completion(false, error.localizedDescription)
                return
            }
            guard let userId = authResult?.user.uid else {
                completion(false, "Error creating user.")
                return
            }
            // Save user data to Firestore
            Firestore.firestore().collection("users").document(userId).setData([
                "name": name,
                "email": email,
                "userId": userId
            ]) { error in
                if let error = error {
                    completion(false, "Error saving user data: \(error.localizedDescription)")
                } else {
                    self.fetchUser()
                    completion(true, nil)
                }     }}}}
