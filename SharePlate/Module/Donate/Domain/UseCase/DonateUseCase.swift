// 
//  DonateUseCase.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation
import Combine

protocol DonateUseCase {
    func fetch() -> AnyPublisher<DonateModel, Error>
}

internal final class DefaultDonateUseCase: DonateUseCase {
    private let repository: DonateRepository
    
    init(
        repository: DonateRepository
    ) {
        self.repository = repository
    }

    func fetch() -> AnyPublisher<DonateModel, Error> {
        repository.fetch()
    }
}
