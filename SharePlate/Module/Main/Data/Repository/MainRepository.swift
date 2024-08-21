// 
//  MainRepository.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation
import Combine

protocol MainRepository {
    func fetch() -> AnyPublisher<MainModel, Error>
}

internal final class DefaultMainRepository: MainRepository {
    
    init() { }
    
    func fetch() -> AnyPublisher<MainModel, Error> {
        return Future<MainModel, Error> { promise in
            promise(.success(.init()))
        }
        .eraseToAnyPublisher()
    }
}
