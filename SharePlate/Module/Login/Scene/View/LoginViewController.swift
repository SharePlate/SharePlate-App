// 
//  LoginViewController.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//

import UIKit
import Combine

internal class LoginViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel: LoginViewModel!
    private var cancelables = Set<AnyCancellable>()

    // MARK: - Publisher
    private let didLoadPublisher = PassthroughSubject<Void, Never>()
    
    // MARK: - Initialization Method
    static func create(
        with viewModel: LoginViewModel
    ) -> LoginViewController {
        let vc = LoginViewController()
        vc.viewModel = viewModel
        return vc
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        bindViewModel()
    }
    
    deinit {
        cancelables.forEach { $0.cancel() }
        cancelables.removeAll()
    }

    // MARK: - Setup
    private func setupView() {

    }

    // MARK: - Bind View Model
    private func bindViewModel() {
        let input = LoginViewModel.Input(
            didLoad: didLoadPublisher
        )

        viewModel.bind(input)
        bindViewModelOutput()
    }

    private func bindViewModelOutput() {
        viewModel.output.$result
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self else { return }

            }
            .store(in: &cancelables)
    }
}
