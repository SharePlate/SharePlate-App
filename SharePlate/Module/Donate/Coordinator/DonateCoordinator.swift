// 
//  DonateCoordinator.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import UIKit

public final class DonateCoordinator {
    
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    init(
        navigationController: UINavigationController?
    ) {
        self.navigationController = navigationController
    }

    // MARK: - Private
    // Create View Controller
    private func makeDonateViewController() -> DonateViewController {
        let repository = makeDonateRepository()
        let useCase = makeDonateUseCase(
            respository: repository
        )
        let viewModel = makeDonateViewModel(
            useCase: useCase
        )
        let viewController = DonateViewController.create(
            with: viewModel
        )
        return viewController
    }
    
    // Create View Model
    private func makeDonateViewModel(
        useCase: DonateUseCase
    ) -> DonateViewModel {
        return DonateViewModel(
            coordinator: self, 
            useCase: useCase
        )
    }
    
    // Create Use Case
    private func makeDonateUseCase(
        respository: DonateRepository
    ) -> DonateUseCase {
        return DefaultDonateUseCase(
            repository: respository
        )
    }
    
    // Create Repository
    private func makeDonateRepository() -> DonateRepository {
        return DefaultDonateRepository()
    }
    
    // MARK: - Public
    // Entry Point
    func route() {
        
    }

    func create() -> DonateViewController {
        let vc = makeDonateViewController()
        return vc
    }
}
