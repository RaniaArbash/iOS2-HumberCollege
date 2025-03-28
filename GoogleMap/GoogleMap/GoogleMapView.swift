//
//  GoogleMapView.swift
//  GoogleMap
//
//  Created by Rania Arbash on 2025-03-27.
//

import SwiftUI


import GoogleMaps

struct GoogleMapView: UIViewControllerRepresentable {
    
    var userLocation: CLLocationCoordinate2D?
    var coffeeShops: [CoffeeShop]
    
    init(userLocation: CLLocationCoordinate2D? = nil, coffeShopsList :  [CoffeeShop] = [] ) {
        self.userLocation = userLocation
        self.coffeeShops = coffeShopsList
    }
    
    func makeUIViewController(context: Context) -> GMSMapViewController {
        let viewController = GMSMapViewController()
        viewController.userLocation = userLocation
        viewController.coffeeShops = coffeeShops
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: GMSMapViewController, context: Context) {}
}

class GMSMapViewController: UIViewController {
    
    var userLocation: CLLocationCoordinate2D?
    var coffeeShops: [CoffeeShop]?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let location = userLocation {
            let camera = GMSCameraPosition.camera(withLatitude: location.latitude, longitude: location.longitude, zoom: 14.0) // Toronto Example
            let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
            addMarkers(to: mapView)

            view.addSubview(mapView)
            
            // Show user location
            mapView.isMyLocationEnabled = true
        }
    }
    
    private func addMarkers(to mapView: GMSMapView) {
        // User location marker
        if let location = userLocation {
            let marker = GMSMarker()
            marker.position = location
            marker.title = "You are here"
            marker.icon = GMSMarker.markerImage(with: .blue)
            marker.map = mapView
        }
        
        // Coffee shops markers
        if let list = coffeeShops {
            for shop in list {
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2D(latitude: shop.latitude, longitude: shop.longitude)
                marker.title = shop.name
                marker.icon = GMSMarker.markerImage(with: .brown)
                marker.map = mapView
            }
        }
    }
}

