// 
//  LoginCoordinator.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//

import UIKit

public final class LoginCoordinator {
    
    // MARK: - Properties
    private var navigationController: UINavigationController?
    
    init(
        navigationController: UINavigationController?
    ) {
        self.navigationController = navigationController
    }

    // MARK: - Private
    // Create View Controller
    private func makeLoginViewController() -> LoginViewController {
        let repository = makeLoginRepository()
        let useCase = makeLoginUseCase(
            respository: repository
        )
        let viewModel = makeLoginViewModel(
            useCase: useCase
        )
        let viewController = LoginViewController.create(
            with: viewModel
        )
        return viewController
    }
    
    // Create View Model
    private func makeLoginViewModel(
        useCase: LoginUseCase
    ) -> LoginViewModel {
        return LoginViewModel(
            coordinator: self, 
            useCase: useCase
        )
    }
    
    // Create Use Case
    private func makeLoginUseCase(
        respository: LoginRepository
    ) -> LoginUseCase {
        return DefaultLoginUseCase(
            repository: respository
        )
    }
    
    // Create Repository
    private func makeLoginRepository() -> LoginRepository {
        return DefaultLoginRepository()
    }
    
    // MARK: - Public
    // Entry Point
    func route() {
        
    }

    func create() -> LoginViewController {
        let vc = makeLoginViewController()
        return vc
    }
}
