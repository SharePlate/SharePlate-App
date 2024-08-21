//
//  LoginView.swift
//  SharePlate
//
//  Created by Muhammad Yusuf on 21/08/24.
//

import SwiftUI

struct LogginginView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.99, green: 0.99, blue: 0.99)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Giving for world")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 393, height: 580)
                    
                    Spacer()
                    SignInUIView()
                        .frame(height: 200)
                    
                    Spacer()
                }
                .padding(.bottom, 10)
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    LogginginView()
}
