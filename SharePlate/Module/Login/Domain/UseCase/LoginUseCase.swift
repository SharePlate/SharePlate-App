// 
//  LoginUseCase.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//

import Foundation
import Combine

protocol LoginUseCase {
    func fetch() -> AnyPublisher<LoginModel, Error>
}

internal final class DefaultLoginUseCase: LoginUseCase {
    private let repository: LoginRepository
    
    init(
        repository: LoginRepository
    ) {
        self.repository = repository
    }

    func fetch() -> AnyPublisher<LoginModel, Error> {
        repository.fetch()
    }
}
