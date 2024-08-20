//
//  ProfileViewModel.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI
import MapKit

class ProfileViewModel: ObservableObject {
    @Published var signOutConfirmation = false
    @Published var deleteAccountConfirmation = false
    @Published var editingNumber = false
    @Published var editingAddressDetail = false
    @Published var goToMap = false
    
    @Published var phone = ""
    @Published var address = ""
    
    @Published var userPos: MapCameraPosition = .userLocation(fallback: .automatic)
    
    
    let mockData: UserModel =
    UserModel(email: "pakpres@jkt.pres.co.id", name: "Pawowo Subianto", address: "", addressDetail: "House number 8 with white gate, next to red house", phoneNumber: "0123456789101112", profilePicture: "")
    
    // Handle save logic
    func savePhoneNumber() {
        // Implement phone number save logic here
    }
    
    func saveAddressDetail() {
        // Implement address detail save logic here
    }
    
    func signOut() {
        // Implement sign out logic here
    }
    
    func deleteAccount() {
        // Implement account deletion logic here
    }
}


