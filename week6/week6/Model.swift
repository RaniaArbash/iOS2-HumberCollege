//
//  Model.swift
//  week6
//
//  Created by Rania Arbash on 2025-02-14.
//

import Foundation

struct UnsplasheImage : Codable , Identifiable{
    
    let id: String
    let urls : urlsObject
    let description: String?
    
}

struct urlsObject : Codable {
    let regular: String
}


struct SearchResult : Codable{
    let results : [UnsplasheImage]
}
