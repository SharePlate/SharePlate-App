//
//  MapSelectionView.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapSelectionView: View {
    @State private var tappedCoordinate: CLLocationCoordinate2D? = nil
    @StateObject private var locationManager = LocationManager()
    @State private var currentAddress: String = "Fetching current address..."
    @State private var selectedAddress: String = "No location selected"
    @State private var searchText: String = ""
    @State private var searchResults: [MKMapItem] = []
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            MapView(tappedCoordinate: $tappedCoordinate, userLocation: locationManager.userLocation, currentAddress: $currentAddress, selectedAddress: $selectedAddress)
                .edgesIgnoringSafeArea(.all)
                .onAppear {
                    locationManager.requestLocation()
                }
            
            VStack {
                HStack {
                    TextField("Search for a location", text: $searchText, onCommit: {
                        performSearch()
                    })
                    .textFieldStyle(.plain)
                    .padding()
                    
                    Button(action: {
                        performSearch()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding()
                    }
                }
                .background(.thinMaterial)
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(Color.primary, lineWidth: 0.1)
                )
                
                // Search Results
                if !searchResults.isEmpty {
                    ScrollView{
                        VStack{
                            ForEach(searchResults, id: \.self) { item in
                                Button(action: {
                                    if let coordinate = item.placemark.location?.coordinate {
                                        tappedCoordinate = coordinate
                                        selectedAddress = item.placemark.title ?? "Selected location"
                                        searchText = ""
                                        searchResults = []
                                        
                                        // Dismiss the keyboard
                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                    }
                                }) {
                                    VStack {
                                        HStack {
                                            Text(item.name ?? "Unknown place").padding(.vertical)
                                            Spacer()
                                        }
                                        
                                        Divider()
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.primary, lineWidth: 0.1)
                    )
                }
                
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("Your Current Location:").bold()
                        Text(currentAddress)
                        
                        Text("Your Selected Location:").bold()
                        Text(selectedAddress)
                        
                        Button{
                            if let userLocation = locationManager.userLocation {
                                saveToUserDefaults(address: currentAddress, coordinate: userLocation, forKey: "Address")
                            }
                            dismiss()
                        }label: {
                            HStack{
                                Spacer()
                                Text("Use Current Location")
                                Spacer()
                                
                            }
                            .padding()
                            .foregroundStyle(.white)
                            .background(.blue)
                            .clipShape(Capsule())
                        }
                        
                        Button{
                            if let tappedCoordinate = tappedCoordinate {
                                saveToUserDefaults(address: selectedAddress, coordinate: tappedCoordinate, forKey: "Address")
                            }
                            dismiss()
                        }label: {
                            HStack{
                                Spacer()
                                Text("Use Selected Location")
                                Spacer()
                                
                            }
                            .padding()
                            .foregroundStyle(.blue)
                            .background(.white)
                            .clipShape(Capsule())
                        }
                        
                    }
                    Spacer()
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.primary, lineWidth: 0.1)
                )
            }
            .padding()
        }
    }
    
    func performSearch() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if let error = error {
                print("Search error: \(error.localizedDescription)")
            } else {
                searchResults = response?.mapItems ?? []
            }
        }
    }
    
    func saveToUserDefaults(address: String, coordinate: CLLocationCoordinate2D, forKey key: String) {
        UserDefaults.standard.set(address, forKey: "\(key)Address")
        UserDefaults.standard.set(coordinate.latitude, forKey: "\(key)Latitude")
        UserDefaults.standard.set(coordinate.longitude, forKey: "\(key)Longitude")
        print("Saved \(address) and coordinates (\(coordinate.latitude), \(coordinate.longitude)) to UserDefaults with key \(key)")
    }
}

#Preview {
    MapSelectionView()
}

