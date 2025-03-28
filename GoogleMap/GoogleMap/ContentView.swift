//
//  ContentView.swift
//  GoogleMap
//
//  Created by Rania Arbash on 2025-03-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    
        var body: some View {
            VStack {
                if let location = locationManager.userLocation {
                    Text("Latitude: \(location.latitude)")
                    Text("Longitude: \(location.longitude)")
                    Text("list: \(locationManager.coffeeShops.count)")
                             
                    ZStack{
                        GoogleMapView(userLocation: location, coffeShopsList: locationManager.coffeeShops)
                                            .edgesIgnoringSafeArea(.all)
                    }
                } else {
                    Text("Fetching Location...")
                        .foregroundColor(.gray)
                }
                if locationManager.userLocation == nil {
                    Button(action: {
                        locationManager.requestPermission()
                    }) {
                        Text("Request Location Permission")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            .onAppear {
                locationManager.startUpdatingLocation()
            }
            .onDisappear {
                locationManager.stopUpdatingLocation()
            }
        }
    }

