//
//  DonatesViewModel.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation
import SwiftUI
import CloudKit
import Combine

import SwiftUI

class DonatesViewModel: ObservableObject {
    
    @Published var text: String = ""
    @Published var donates: [DonateModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchItems()
    }
    
//    func addButtonPressed() {
//        guard !text.isEmpty else { return }
//        addItem(name: text)
//    }
//    
    func addItem(donatesModel: [DonatesModel]) {
        for donate in donatesModel {
            CloudKitUtility.add(item: donate) { result in
                print(result)
            }
        }
    }
    
    func fetchItems() {
//        let predicate = NSPredicate(value: true)
//        let recordType = "Fruits"
//        CloudKitUtility.fetch(predicate: predicate, recordType: recordType)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//                
//            } receiveValue: { [weak self] returnedItems in
//                self?.fruits = returnedItems
//            }
//            .store(in: &cancellables)
    }
    
    
    func updateItem(donate: DonatesModel) {
//        guard let newFruit = donate.update(newName: "NEW NAME!!!!!!!") else { return }
//        CloudKitUtility.update(item: newFruit) { [weak self] result in
//            print("UPDATE COMPLETED")
//            self?.fetchItems()
//        }
    }
    
    func deleteItem(indexSet: IndexSet) {
//        guard let index = indexSet.first else { return }
//        let fruit = donates[index]
        
//        CloudKitUtility.delete(item: fruit)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in
//                
//            } receiveValue: { [weak self] success in
//                print("DELETE IS: \(success)")
//                self?.fruits.remove(at: index)
//            }
//            .store(in: &cancellables)
    }
}
