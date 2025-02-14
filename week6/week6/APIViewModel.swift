//
//  APIViewModel.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
//

import Foundation

class APIViewModel : ObservableObject {
    @Published var images : [UnsplasheImage] = []
    @Published var searchQuery : String = " "
    //https://unsplash.com/documentation
    
    func fetchImages() {
        let urlString = "https://api.unsplash.com/photos/random?count=10&client_id=zXkWQGVjzhcmVvtQPwGEYVSljkM6rEnibhqatelGatc"
        guard let urlObject = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: urlObject) { data, respose, error in
            
            if let error = error {
                        print("Network error: \(error.localizedDescription)")
                        return
                    }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        self.images = try JSONDecoder().decode([UnsplasheImage].self, from: data)
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }
            }
        }.resume()
    }
    
    func fetchImagesWithSearch() {
        let urlString = "https://api.unsplash.com//search/photos?query=\(searchQuery)&client_id=GetYour Key"
        guard let urlObject = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: urlObject) { data, respose, error in
            
            if let error = error {
                        print("Network error: \(error.localizedDescription)")
                        return
                    }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let result = try JSONDecoder().decode(SearchResult.self, from: data)
                        self.images = result.results
                    } catch {
                        print("Decoding error: \(error)")
                    }
                }
            }
        }.resume()
    }
    
    
    
    
    func fetchImagesWithSearch1() async {
        let urlString = "https://api.unsplash.com//search/photos?query=\(searchQuery)&client_id=GetYour Key"
        guard let urlObject = URL(string: urlString) else {return}
        
        do {
            let (data,_) = try await URLSession.shared.data(from: urlObject)
            let result = try JSONDecoder().decode(SearchResult.self, from: data)
            DispatchQueue.main.async {
                                   self.images = result.results
                           }
        } catch {
            print("Error: \(error)")
        }

    }
    
    
}
