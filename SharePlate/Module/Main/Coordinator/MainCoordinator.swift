// 
//  MainCoordinator.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import UIKit

public final class MainCoordinator {
    
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    init(
        navigationController: UINavigationController?
    ) {
        self.navigationController = navigationController
    }

    // MARK: - Private
    // Create View Controller
    private func makeMainViewController() -> MainViewController {
        let repository = makeMainRepository()
        let useCase = makeMainUseCase(
            respository: repository
        )
        let viewModel = makeMainViewModel(
            useCase: useCase
        )
        let viewController = MainViewController.create(
            with: viewModel
        )
        return viewController
    }
    
    // Create View Model
    private func makeMainViewModel(
        useCase: MainUseCase
    ) -> MainViewModel {
        return MainViewModel(
            coordinator: self, 
            useCase: useCase
        )
    }
    
    // Create Use Case
    private func makeMainUseCase(
        respository: MainRepository
    ) -> MainUseCase {
        return DefaultMainUseCase(
            repository: respository
        )
    }
    
    // Create Repository
    private func makeMainRepository() -> MainRepository {
        return DefaultMainRepository()
    }
    
    // MARK: - Public
    // Entry Point
    func route() {
        
    }

    func create() -> MainViewController {
        let vc = makeMainViewController()
        return vc
    }
}
