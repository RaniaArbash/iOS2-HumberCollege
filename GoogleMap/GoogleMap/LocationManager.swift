//
//  LocationManager.swift
//  GoogleMap
//
//  Created by Rania Arbash on 2025-03-27.
//

import Foundation
import CoreLocation

struct CoffeeShop: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var coffeeShops: [CoffeeShop] = []

    @Published var userLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        requestPermission()
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
//    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = location.coordinate
            self.fetchNearbyCoffeeShops()
        }
    }
    
       func fetchNearbyCoffeeShops() {
           let radius = 1000 // 1km radius
           let type = "cafe"
           let urlString = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(userLocation!.latitude),\(userLocation!.longitude)&radius=\(radius)&type=\(type)&key=AIzaSyBKNGXQf_uydq6iK64CMMNs-ehM6llL7R4"
   
           guard let url = URL(string: urlString) else { return }
   
           URLSession.shared.dataTask(with: url) { (data, response, error) in
               if let data = data {
                   do {
                                   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                      let results = json["results"] as? [[String: Any]] {
                                       
                                       DispatchQueue.main.async {
                                           self.coffeeShops = results.compactMap { place in
                                               guard let name = place["name"] as? String,
                                                     let geometry = place["geometry"] as? [String: Any],
                                                     let location = geometry["location"] as? [String: Any],
                                                     let lat = location["lat"] as? Double,
                                                     let lng = location["lng"] as? Double else {
                                                   return nil
                                               }
                                               return CoffeeShop(name: name, latitude: lat, longitude: lng)
                                           }
                                       }
                                   }
                               } catch {
                                   print("Error parsing JSON: \(error.localizedDescription)")
                               }
               }
           }.resume()
       }
}
