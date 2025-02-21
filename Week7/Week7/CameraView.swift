//
//  CameraView.swift
//  Week7
//
//  Created by Rania Arbash on 2025-02-21.
//

import SwiftUI

struct CameraView : UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        let parent: CameraView
         
        init(_ parent: CameraView) {
                    self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                    if let selectedImage = info[.originalImage] as? UIImage {
                        parent.image = selectedImage
                    }
                    parent.presentationMode.wrappedValue.dismiss()
                }
         
                func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                    parent.presentationMode.wrappedValue.dismiss()
                }
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
       }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
}
