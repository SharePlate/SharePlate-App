// 
//  LoginRepository.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//

import Foundation
import Combine

protocol LoginRepository {
    func fetch() -> AnyPublisher<LoginModel, Error>
}

internal final class DefaultLoginRepository: LoginRepository {
    
    init() { }
    
    func fetch() -> AnyPublisher<LoginModel, Error> {
        return Future<LoginModel, Error> { promise in
            promise(.success(.init()))
        }
        .eraseToAnyPublisher()
    }
}
