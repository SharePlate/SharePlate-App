//
//  AddressDetailView.swift
//  SharePlate
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI
import MapKit

struct AddressDetailView: View {
    @Binding var editingAddressDetail: Bool
    @Binding var goToAddressList: Bool
    @Binding var goToMap: Bool

    var body: some View {
        VStack {
            VStack{
                HStack {
                    VStack(alignment: .leading) {
                        Text("Address Detail")
                            .font(.footnote).bold()
                        Text(UserDefaults.standard.string(forKey: "AddressAddress") ?? "")
                    }
                    Spacer()
                    Button {
                        editingAddressDetail = true
                    } label: {
                        Image(systemName: "pencil.circle")
                            .font(.title)
                    }
                }
                
            }
            
           
                
                Divider()
                
                VStack(alignment: .leading) {
                    Map{
                        Marker("Home", systemImage: "house", coordinate: CLLocationCoordinate2D(latitude: UserDefaults.standard.double(forKey: "AddressLatitude"), longitude: UserDefaults.standard.double(forKey: "AddressLongitude")))
                    }
                    .frame(height: 200)
                    .onAppear {
                        CLLocationManager().requestWhenInUseAuthorization()
                    }
//                    .onTapGesture {
//                        goToMap = true
//                    }
                    
                    Text(UserDefaults.standard.string(forKey: "AddressAddress") ?? "")
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                        .font(.footnote)
                        .padding(.bottom, 5)
                        .padding(.horizontal, 10)
                }
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
