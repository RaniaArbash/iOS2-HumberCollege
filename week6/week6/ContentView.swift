//
//  ContentView.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = APIViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                
            // search bar will update the query
            TextField("Search For Images .....", text: $viewModel.searchQuery, 
                      onCommit: {
                         viewModel.fetchImagesWithSearch()
            }).textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(viewModel.images) { image in
                    AsyncImage(url: URL(string: image.urls.regular)) { img in
                        switch img {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().scaledToFill().cornerRadius(5).shadow(radius: 5)
                        case .failure(_):
                            Image(systemName: "photo").resizable().scaledToFit().foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    Text(image.description ?? "No Description")
                }
            }
            .padding()
        }.onAppear {
            viewModel.fetchImages()
        }.refreshable {
          
            viewModel.fetchImages()
            viewModel.searchQuery = " "
        }
    }
}
