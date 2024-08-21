// 
//  DonateResponseDTO.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation

internal struct DonateResponseDTO: Decodable {
    
}

extension DonateResponseDTO {
    func toDomain() -> DonateModel {
        return .init()
    }
}
