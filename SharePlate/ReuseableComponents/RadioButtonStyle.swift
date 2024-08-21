//
//  RadioButtonStyle.swift
//  SharePlate_Test313
//
//  Created by Ali Haidar on 8/21/24.
//

import SwiftUI

struct RadioButtonStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(configuration.isOn ? .orange : .gray)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

