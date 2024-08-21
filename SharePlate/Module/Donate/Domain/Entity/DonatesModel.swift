//
//  DonatesModel.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation
import CloudKit

internal struct DonatesModel: CloudKitableProtocol, Identifiable, Equatable  {
    let id = UUID()
    var name: String
    var address: String
    var isHalal: Bool
    var quantity: Int
    var note: String
    var timePickUp: Date
    var record: CKRecord

    init?(record: CKRecord) {
        guard let note = record[CKModelConstants.note] as? String,
            let name = record["name"] as? String,
            let address = record["address"] as? String,
            let isHalal = record["isHalal"] as? Bool,
            let quantity = record["quantity"] as? Int,
            let timePickUp = record["timePickUp"] as? Date else {
            return nil
        }
        
        self.name = name
        self.note = note
        self.address = address
        self.isHalal = isHalal
        self.quantity = quantity
        self.timePickUp = timePickUp
        self.record = record
    }
    
    init?(name: String, address: String, isHalal: Bool, quantity: Int?, timePickUp: Date?, note: String) {
        let record = CKRecord(recordType: CKModelConstants.donates)
        record["name"] = name
        record["note"] = note
        record["address"] = address
        record["isHalal"] = isHalal
        record["quantity"] = quantity
        record["timePickUp"] = timePickUp

        // Initialize all properties before calling the other initializer
        self.name = name
        self.note = note
        self.address = address
        self.isHalal = isHalal
        self.quantity = quantity ?? 0
        self.timePickUp = timePickUp ?? Date()
        self.record = record
    }
}
