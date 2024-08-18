//
//  ProfileView.swift
//  SharePlate
//
//  Created by Ages on 18/08/24.
//

import SwiftUI
import CoreLocation

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8){
            Section(header: Text("Name")) {
                TextField(text: $viewModel.address.name) {
                    Text("Name")
                        .font(Font.custom("Lato", size: 14))
                }
                .padding(.bottom, 20)
            }
            .textFieldStyle(.roundedBorder)
            
            Section(header: Text("Email")) {
                TextField(text: $viewModel.address.email) {
                    Text("Email")
                        .font(Font.custom("Lato", size: 14))
                }
                .padding(.bottom, 20)
            }.textFieldStyle(.roundedBorder)
            
            Section(header: Text("Phone Number")) {
                TextField(text: $viewModel.address.phoneNumber) {
                    Text("Phone Number")
                        .font(Font.custom("Lato", size: 14))
                }
                .padding(.bottom, 20)
            }.textFieldStyle(.roundedBorder)
            
            Section(header: Text("Address")) {
                HStack {
                    TextField(text: $viewModel.address.province) {
                        Text("Province")
                            .font(Font.custom("Lato", size: 14))
                    }
                    
                    TextField(text: $viewModel.address.city) {
                        Text("City")
                            .font(Font.custom("Lato", size: 14))
                    }
                }
                
                HStack {
                    TextField(text: $viewModel.address.subdistrict) {
                        Text("Subdistrict")
                            .font(Font.custom("Lato", size: 14))
                    }
                    
                    TextField(text: $viewModel.address.postCode) {
                        Text("Post Code")
                            .font(Font.custom("Lato", size: 14))
                    }
                }
                
                TextField(text: $viewModel.address.detail) {
                    Text("Streets Detail")
                        .font(Font.custom("Lato", size: 14))
                }.frame(alignment: .leading)
                
            }.textFieldStyle(.roundedBorder)
             
            Button("Get Coordinates") {
                viewModel.getCoordinates()
            }
            .padding(.top, 20)
            
            if let coordinates = viewModel.address.coordinates {
                Text("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
                    .padding(.top, 20)
            }
        }
        .padding(.horizontal, 20)
        .disableAutocorrection(true)
    }
}


#Preview {
    ProfileView()
}
