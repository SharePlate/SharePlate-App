//
//  AddAddressButton.swift
//  SharePlate
//
//  Created by Ali Haidar on 8/21/24.
//

import SwiftUI

struct AddAddressButton: View {
    @Binding var goToAddressList: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Address Detail")
                .font(.footnote).bold()
            
            Button{
                goToAddressList = true
            }label: {
                HStack{
                    Spacer()
                    Image(systemName: "plus.circle").foregroundStyle(.orange)
                    Text("Add my address").foregroundStyle(.black)
                    Spacer()
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}
