// 
//  LoginResponseDTO.swift
//  SharePlate
//
//  Created by robert theo on 13/08/24.
//

import Foundation

internal struct LoginResponseDTO: Decodable {
    
}

extension LoginResponseDTO {
    func toDomain() -> LoginModel {
        return .init()
    }
}
