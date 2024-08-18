// 
//  ProfileRepository.swift
//  SharePlate
//
//  Created by Ages on 18/08/24.
//

import Foundation
import Combine

protocol ProfileRepository {
    func fetch() -> AnyPublisher<ProfileModel, Error>
}

internal final class DefaultProfileRepository: ProfileRepository {
    
    init() { }
    
    func fetch() -> AnyPublisher<ProfileModel, Error> {
        return Future<ProfileModel, Error> { promise in
            promise(.success(.init()))
        }
        .eraseToAnyPublisher()
    }
}
