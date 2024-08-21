//
//  ProductViewModel.swift
//  SharePlate
//
//  Created by robert theo on 20/08/24.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var products: [DonatesModel] = []
    @Published var newProductName: String = ""
    @Published var newProductAddress: String = ""
    @Published var newProductQuantity: Int = 1
    @Published var newProductIsHalal: Bool = true
    @Published var note: String = ""
    
    func addProduct() {
        guard let newProduct =  DonatesModel(name: newProductName, address: newProductAddress, isHalal: newProductIsHalal, quantity: newProductQuantity, timePickUp: nil, note: note) else { return }
        products.append(newProduct)
        self.newProductName = newProductName
        self.newProductAddress = newProductAddress
        self.newProductQuantity = newProductQuantity
        self.newProductIsHalal = true
    }
    
    func removeProduct(at index: IndexSet) {
        products.remove(atOffsets: index)
    }
}
