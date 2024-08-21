//
//  AddAddresView.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/21/24.
//

import SwiftUI
import MapKit

struct AddAddresView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var goToMap: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Map(){
                    Marker("Home", systemImage: "house", coordinate: CLLocationCoordinate2D(latitude: UserDefaults.standard.double(forKey: "AddressLatitude"), longitude: UserDefaults.standard.double(forKey: "AddressLongitude")))
                }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding()
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onTapGesture {
                        goToMap = true
                    }
                
                
                Text("Location").bold().padding(.top)
                
                InputField(hint: "Province", input: .constant(String()))
                InputField(hint: "City", input: .constant(String()))
                InputField(hint: "Subdistrict", input: .constant(String()))
                InputField(hint: "Postal Code", input: .constant(String())).keyboardType(.numberPad)
                
                
                Text("Address Details").bold().padding(.top)
                InputField(hint: "Ex. House number", input: .constant(String()))
                
                Spacer()
            }
            .toolbar(content: {
                Button{
                    dismiss()
                }label: {
                    Text("Save")
                }
            })
            .padding()
            .navigationDestination(isPresented: $goToMap){
                MapSelectionView()
            }
        }
        .background(.thinMaterial)
    }
}

#Preview {
    AddAddresView()
}

struct InputField: View {
    var hint: String
    @Binding var input: String
    var body: some View {
        TextField(hint, text: $input)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
