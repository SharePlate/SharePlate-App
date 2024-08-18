// 
//  ProfileResponseDTO.swift
//  SharePlate
//
//  Created by Ages on 18/08/24.
//

import Foundation

internal struct ProfileResponseDTO: Decodable {
    
}

extension ProfileResponseDTO {
    func toDomain() -> ProfileModel {
        return .init()
    }
}
