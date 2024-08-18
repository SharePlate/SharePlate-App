// 
//  ProfileCoordinator.swift
//  SharePlate
//
//  Created by Ages on 18/08/24.
//

import UIKit

public final class ProfileCoordinator {
    
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    init(
        navigationController: UINavigationController?
    ) {
        self.navigationController = navigationController
    }

    // MARK: - Private
    // Create View Controller
    private func makeProfileViewController() -> ProfileViewController {
        let repository = makeProfileRepository()
        let useCase = makeProfileUseCase(
            respository: repository
        )
        let viewModel = makeProfileViewModel(
            useCase: useCase
        )
        let viewController = ProfileViewController.create(
            with: viewModel
        )
        return viewController
    }
    
    // Create View Model
    private func makeProfileViewModel(
        useCase: ProfileUseCase
    ) -> ProfileViewModel {
        return ProfileViewModel(
            coordinator: self, 
            useCase: useCase
        )
    }
    
    // Create Use Case
    private func makeProfileUseCase(
        respository: ProfileRepository
    ) -> ProfileUseCase {
        return DefaultProfileUseCase(
            repository: respository
        )
    }
    
    // Create Repository
    private func makeProfileRepository() -> ProfileRepository {
        return DefaultProfileRepository()
    }
    
    // MARK: - Public
    // Entry Point
    func route() {
        
    }

    func create() -> ProfileViewController {
        let vc = makeProfileViewController()
        return vc
    }
}
