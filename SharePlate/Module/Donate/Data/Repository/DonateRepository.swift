// 
//  DonateRepository.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation
import Combine

protocol DonateRepository {
    func fetch() -> AnyPublisher<DonateModel, Error>
}

internal final class DefaultDonateRepository: DonateRepository {
    
    init() { }
    
    func fetch() -> AnyPublisher<DonateModel, Error> {
        return Future<DonateModel, Error> { promise in
            promise(.success(.init()))
        }
        .eraseToAnyPublisher()
    }
}
