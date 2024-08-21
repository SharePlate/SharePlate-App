// 
//  MainResponseDTO.swift
//  SharePlate
//
//  Created by robert theo on 19/08/24.
//

import Foundation

internal struct MainResponseDTO: Decodable {
    
}

extension MainResponseDTO {
    func toDomain() -> MainModel {
        return .init()
    }
}
