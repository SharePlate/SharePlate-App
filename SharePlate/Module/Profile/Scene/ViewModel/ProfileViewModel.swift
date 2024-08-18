// 
//  ProfileViewModel.swift
//  SharePlate
//
//  Created by Ages on 18/08/24.
//

import Foundation
import Combine

internal final class ProfileViewModel {
    
    // MARK: - Properties
    private let coordinator: ProfileCoordinator
    private let useCase: ProfileUseCase
    private var cancelables = Set<AnyCancellable>()
    let output = Output()
    
    // for address
    @Published var address = Address(name: "", email: "", phoneNumber: "", province: "", city: "", subdistrict: "", postCode: "", detail: "", coordinates: nil)
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Input Output Variable
    struct Input {
        let didLoad: PassthroughSubject<Void, Never>
    }
    
    class Output {
        @Published var result: ProfileResultData = .initial
    }
    
    deinit {
        cancelables.forEach { $0.cancel() }
        cancelables.removeAll()
    }
    
    // MARK: - Initializer
    init(
        coordinator: ProfileCoordinator, 
        useCase: ProfileUseCase
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
    
    // for address 
    func getCoordinates() {
        let fullAddress = fullAddressString()
        getCoordinate(addressString: fullAddress) { result in
            switch result {
            case .success(let coordinate):
                DispatchQueue.main.async {
                    self.address.coordinates = coordinate
                }
            case .failure(let error):
                print("Error getting coordinates: \(error)")
            }
        }
    }
    
    private func fullAddressString() -> String {
        return "\(address.detail), \(address.subdistrict), \(address.city), \(address.province), \(address.postCode)"
    }
    
    private func getCoordinate(addressString: String, completionHandler: @escaping (Result<CLLocationCoordinate2D, Error>) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            
            if let placemark = placemarks?.first, let location = placemark.location {
                completionHandler(.success(location.coordinate))
            } else {
                let error = NSError(domain: "GeocodingErrorDomain", code: 0, userInfo: [NSLocalizedDescriptionKey: "No valid coordinates found"])
                completionHandler(.failure(error))
            }
        }
    }
}

extension ProfileViewModel {
    enum ProfileResultData {
        case initial
        case success(ProfileModel)
        case failure(Error)
    }
}
