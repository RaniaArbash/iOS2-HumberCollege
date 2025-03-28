////
////  PlacesViewModel.swift
////  GoogleMap
////
////  Created by Rania Arbash on 2025-03-27.
////
//
//import Foundation
//import SwiftUI
//

import Foundation
//import GooglePlaces
import GoogleMaps
import SwiftUI
//struct CoffeeShop: Identifiable {
//    let id = UUID()
//    let name: String
//    let latitude: Double
//    let longitude: Double
//}

class MapViewModel: ObservableObject {

    
  //  @State var placesVM = MapViewModel()
//    @Published var coffeeShops: [CoffeeShop] = []
//
//       func fetchNearbyCoffeeShops(latitude: Double, longitude: Double, apiKey: String) {
//           let radius = 1000 // 1km radius
//           let type = "cafe"
//           let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=\(radius)&type=\(type)&key=\(apiKey)"
//   
//           guard let url = URL(string: urlString) else { return }
//   
//           URLSession.shared.dataTask(with: url) { (data, response, error) in
//               if let data = data {
//                   do {
//                                   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                                      let results = json["results"] as? [[String: Any]] {
//                                       
//                                       DispatchQueue.main.async {
//                                           self.coffeeShops = results.compactMap { place in
//                                               guard let name = place["name"] as? String,
//                                                     let geometry = place["geometry"] as? [String: Any],
//                                                     let location = geometry["location"] as? [String: Any],
//                                                     let lat = location["lat"] as? Double,
//                                                     let lng = location["lng"] as? Double else {
//                                                   return nil
//                                               }
//                                               return CoffeeShop(name: name, latitude: lat, longitude: lng)
//                                           }
//                                       }
//                                   }
//                               } catch {
//                                   print("Error parsing JSON: \(error.localizedDescription)")
//                               }
////                   if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
////                       print(json) // Parse JSON to extract place names & coordinates
////                   }
//               }
//           }.resume()
//       }
//}

//class PlacesViewModel : ObservableObject {
//    
//    @State var placesVM = PlacesViewModel()
//    
//    
//    func fetchNearbyCoffeeShops(latitude: Double, longitude: Double, apiKey: String) {
//        let radius = 1000 // 1km radius
//        let type = "cafe"
//        let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=\(radius)&type=\(type)&key=\(apiKey)"
//        
//        guard let url = URL(string: urlString) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let data = data {
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
//                    print(json) // Parse JSON to extract place names & coordinates
//                }
//            }
//        }.resume()
//    }
//
//}
