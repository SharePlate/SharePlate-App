//
//  ProductModel.swift
//  SharePlate
//
//  Created by robert theo on 20/08/24.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    var name: String
    var quantity: Int
    var isHalal: Bool
}
