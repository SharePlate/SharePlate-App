// 
//  MainUseCase.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation
import Combine

protocol MainUseCase {
    func fetch() -> AnyPublisher<MainModel, Error>
}

internal final class DefaultMainUseCase: MainUseCase {
    private let repository: MainRepository
    
    init(
        repository: MainRepository
    ) {
        self.repository = repository
    }

    func fetch() -> AnyPublisher<MainModel, Error> {
        repository.fetch()
    }
}
