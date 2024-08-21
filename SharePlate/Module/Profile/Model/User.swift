//
//  User.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/20/24.
//

import Foundation
import SwiftData

@Model
final class UserModel {
    
    var email: String = ""
    var name: String = ""
    var address: String = ""
    var addressDetail: String = ""
    var phoneNumber: String = ""
    var profilePicture: String = ""
    
    
    
    init(email: String, name: String, address: String, addressDetail: String, phoneNumber: String, profilePicture: String) {
        self.email = email
        self.name = name
        self.address = address
        self.addressDetail = addressDetail
        self.phoneNumber = phoneNumber
        self.profilePicture = profilePicture
    }
    
}


    

