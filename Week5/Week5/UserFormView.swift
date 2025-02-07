//
//  UserFormView.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import SwiftUI

struct UserFormView: View {

    @EnvironmentObject var userVM : UserViewModel
    @Environment(\.dismiss) var dismiss
    
      @State private var name: String = ""
      @State private var email: String = ""
      @State private var password: String = ""
      @State private var receiveNewsletter: Bool = false
      @State private var age: Int = 18
      @State private var birthdate = Date()
      @State private var selectedGender = "Male"
      @State private var profileImage: UIImage? = nil
      @State private var isImagePickerPresented = false
      @State private var showAlert = false
      @State private var alertMessage = ""
    let genders = ["Male", "Female", "Other"]

    var body: some View {
    
        Form{
            Section(header: Text("Personal Information")) {
                              TextField("Full Name", text: $name)
                              TextField("Email", text: $email)
                                  .keyboardType(.emailAddress)
                              SecureField("Password", text: $password)
                          }
            
            
            
            Section(header: Text("Profile Picture")) {
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                                      .resizable()
                                      .scaledToFit()
                                      .frame(height: 150)
                                      .clipShape(Circle())
                        }
                        Button("Upload Image / Take Photo") {
                                  isImagePickerPresented = true
                        }
                        .sheet(isPresented: $isImagePickerPresented) {
                            ImagePicker(selectedImage: $profileImage)
                        }
                    }
            
            
            Section(header: Text("Preferences")) {
                               Toggle("Receive Newsletter", isOn: $receiveNewsletter)
                               Stepper("Age: \(age)", value: $age, in: 1...100)
                               DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                               
                               Picker("Gender", selection: $selectedGender) {
                                   ForEach(genders, id: \.self) { gender in
                                       Text(gender)
                                   }
                               }
                               .pickerStyle(SegmentedPickerStyle())
                           }
            
            
            
            Section {
                   Button("Submit") {
                       // validate
                       validateForm()
                   }
                 .frame(maxWidth: .infinity, alignment: .center)
                .alert(isPresented: $showAlert) {
                            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                                                   }
                           }
                       }
            
        }
    
    
    func validateForm() {
                if name.isEmpty || email.isEmpty || password.isEmpty {
                    alertMessage = "Please fill in all required fields (Name, Email, Password)."
                    showAlert = true
                } else {
                    submitForm()
                }
            }
    
    func submitForm() {
        userVM.addNewUser(name: name, email: email, receiveNewsletter: receiveNewsletter, age: age, birthdate: birthdate, gender: selectedGender, profileImage: profileImage?.pngData())
        dismiss()
       }
        
    }



#Preview {
    UserFormView()
}
