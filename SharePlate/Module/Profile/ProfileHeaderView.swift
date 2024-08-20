//
//  ProfileHeaderView.swift
//  SharePlate
//
//  Created by Ali Haidar on 8/20/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var name: String
    var email: String

    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(Color(.gray))
            Text("PS").font(.largeTitle).bold()
        }
        .frame(width: 105, height: 105)
        .padding(.vertical)
        
        Text(name).bold()
        Text(email).font(.footnote)
    }
}
