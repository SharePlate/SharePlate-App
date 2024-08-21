//
//  Address.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/21/24.
//

import Foundation
import SwiftData

@Model
final class Address {
    
    var address: String = ""
    var lat: String = ""
    var lang: String = ""
    var addressDetail: String = ""
    
    
    init(address: String, lat: String, lang: String, addressDetail: String) {
        self.address = address
        self.lat = lat
        self.lang = lang
        self.addressDetail = addressDetail
    }
}
