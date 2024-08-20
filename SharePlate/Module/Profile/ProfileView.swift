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
    

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ProfileHeaderView(name: viewModel.mockData.name, email: viewModel.mockData.email)
                    
                    PhoneNumberView(phoneNumber: viewModel.mockData.phoneNumber, editingNumber: $viewModel.editingNumber)
                        .padding(.top)
                    
                    AddressDetailView(editingAddressDetail: $viewModel.editingAddressDetail, goToMap: $viewModel.goToMap)
                        .padding(.top)
                }
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
                .foregroundStyle(.white)
                .background(Color(.blue))
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            
            Button {
                viewModel.deleteAccountConfirmation = true
            } label: {
                Text("Delete Account")
                    .foregroundStyle(.red)
            }
            .padding(.bottom)
            .navigationDestination(isPresented: $viewModel.goToMap) {
                MapSelectionView()
            }
        }
        .padding(.horizontal)
        
        .alert("Edit phone number", isPresented: $viewModel.editingNumber) {
            TextField("08xxx", text: $viewModel.phone).keyboardType(.numberPad)
            Button("Save") {
                viewModel.savePhoneNumber()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Enter your new phone number here")
        }
        
        .alert("Edit address detail", isPresented: $viewModel.editingAddressDetail) {
            TextField("House no...", text: $viewModel.address)
            Button("Save") {
                viewModel.saveAddressDetail()
            }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Enter your new address detail here")
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
