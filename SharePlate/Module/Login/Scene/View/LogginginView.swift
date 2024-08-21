//
//  LoginView.swift
//  SharePlate
//
//  Created by Muhammad Yusuf on 21/08/24.
//

import SwiftUI
import AuthenticationServices


struct LogginginView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var authManager: AuthManager

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
    
    func handleAppleID(_ result: Result<ASAuthorization, Error>) {
        if case let .success(auth) = result {
            guard let appleIDCredentials = auth.credential as? ASAuthorizationAppleIDCredential else {
                print("AppleAuthorization failed: AppleID credential not available")
                return
            }

            Task {
                do {
                    let result = try await authManager.appleAuth(
                        appleIDCredentials,
                        nonce: AppleSignInManager.nonce
                    )
                    if let result = result {
                        dismiss()
                    }
                } catch {
                    print("AppleAuthorization failed: \(error)")
                    // Here you can show error message to user.
                }
            }
        }
        else if case let .failure(error) = result {
            print("AppleAuthorization failed: \(error)")
            // Here you can show error message to user.
        }
    }
}

#Preview {
    LogginginView()
}
