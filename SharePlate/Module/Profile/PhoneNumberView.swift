//
//  PhoneNumberView.swift
//  SharePlate
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI

struct PhoneNumberView: View {
    var phoneNumber: String
    @Binding var editingNumber: Bool

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Phone Number")
                    .font(.footnote).bold()
                Text(phoneNumber)
            }
            Spacer()
            Button {
                editingNumber = true
            } label: {
                Image(systemName: "pencil.circle")
                    .font(.title)
            }
        }
        .padding()
        .background(.thickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
