// 
//  LoginViewModel.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//

import Foundation
import Combine

internal final class LoginViewModel {
    
    // MARK: - Properties
    private let coordinator: LoginCoordinator
    private let useCase: LoginUseCase
    private var cancelables = Set<AnyCancellable>()
    let output = Output()
    
    // MARK: - Input Output Variable
    struct Input {
        let didLoad: PassthroughSubject<Void, Never>
    }
    
    class Output {
        @Published var result: LoginResultData = .initial
    }
    
    deinit {
        cancelables.forEach { $0.cancel() }
        cancelables.removeAll()
    }
    
    // MARK: - Initializer
    init(
        coordinator: LoginCoordinator, 
        useCase: LoginUseCase
    ) {
        self.coordinator = coordinator
        self.useCase = useCase
    }
    
    // MARK: - Functions
    func bind(_ input: Input) {
        input.didLoad
            .receive(on: DispatchQueue.global())
            .flatMap {
                return self.useCase.fetch()
                    .map { Result.success($0) }
                    .catch { Just(Result.failure($0)) }
                    .eraseToAnyPublisher()
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                guard let self else { return }
                
                switch result {
                case .success(let model):
                    self.output.result = .success(model)
                case .failure(let error):
                    self.output.result = .failure(error)
                }
            }
            .store(in: &cancelables)
    }
}

extension LoginViewModel {
    enum LoginResultData {
        case initial
        case success(LoginModel)
        case failure(Error)
    }
}