// 
//  ProfileModel.swift
//  SharePlate
//
//  Created by Ages on 18/08/24.
//

import Foundation

internal struct ProfileModel: Equatable {
    var name: String
    var email: String
    var phoneNumber: String
    var province: String
    var city: String
    var subdistrict: String
    var postCode: String
    var detail: String
    var coordinates: CLLocationCoordinate2D?
}
