//
//  ProfileView.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI
import MapKit

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    @State private var goToAddressList: Bool = false

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ProfileHeaderView(name: viewModel.mockData.name, email: viewModel.mockData.email)
                    
                    PhoneNumberView(phoneNumber: viewModel.mockData.phoneNumber, editingNumber: $viewModel.editingNumber)
                        .padding(.top)
                    
                    
                    
                    if((UserDefaults.standard.string(forKey: "AddressAddress")?.isEmpty) != nil){
                        AddressDetailView(editingAddressDetail: $viewModel.editingAddressDetail, goToAddressList: $goToAddressList, goToMap: $viewModel.goToMap)
                            .padding(.top)
                    }else{
                        
                        AddAddressButton(goToAddressList: $goToAddressList)
                            .padding(.top)
                    }
                    
                    
                }
            }.navigationDestination(isPresented: $goToAddressList){
                AddressListView()
            }
            
            Spacer()
            
            Button {
                viewModel.signOutConfirmation = true
            } label: {
                HStack {
                    Spacer()
                    Text("Sign Out")
                    Spacer()
                }
                .padding()
                .foregroundStyle(.black)
                .background(.orange)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
            Button {
                viewModel.deleteAccountConfirmation = true
            } label: {
                Text("Delete Account")
                    .foregroundStyle(.orange)
            }
            .padding(.vertical)
//            .navigationDestination(isPresented: $viewModel.goToMap) {
//                MapSelectionView()
//            }
            .navigationDestination(isPresented: $viewModel.editingAddressDetail) {
                AddressListView()
            }
        }
        .padding(.horizontal)
        .background(.thinMaterial)
        
        
        .alert("Edit phone number", isPresented: $viewModel.editingNumber) {
            TextField("08xxx", text: $viewModel.phone).keyboardType(.numberPad)
            Button("Save") {
                viewModel.savePhoneNumber()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Enter your new phone number here")
        }
        
        
        .confirmationDialog("Sign Out", isPresented: $viewModel.signOutConfirmation) {
            Button("Sign Out") {
                viewModel.signOut()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure want to sign out?")
        }
        
        .confirmationDialog("Delete Acc", isPresented: $viewModel.deleteAccountConfirmation) {
            Button("Delete") {
                viewModel.deleteAccount()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure want to delete your account?")
        }
        
    }
}



