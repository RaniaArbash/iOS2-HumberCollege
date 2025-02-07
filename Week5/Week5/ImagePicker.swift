//
//  ImagePicker.swift
//  Week5
//
//  Created by Rania Arbash on 2025-02-07.
//

import SwiftUI
import UIKit
 
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode // To dismiss the picker
 
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
 
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator // Connect to the Coordinator
        picker.sourceType = .photoLibrary // Choose between camera or photo library
        return picker
    }
 
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
 
    }
 
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
 
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
 
        // Called when the user selects an image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss() // Dismiss the picker
        }
 
        // Called when the user cancels the picker
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
