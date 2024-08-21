//
//  SwiftUIView.swift
//  SharePlate
//
//  Created by Muhammad Yusuf on 21/08/24.
//

import UIKit
import AuthenticationServices

class SignInView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Label Creation
        let titleLabel = UILabel()
        titleLabel.text = "Start making a difference today,\nOne step ahead everyday"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = UIColor(red: 0.28, green: 0.30, blue: 0.30, alpha: 1.00)
        
        // Sign In with Apple button
        let signInButton = ASAuthorizationAppleIDButton(type: .signIn, style: .black)
        signInButton.addTarget(self, action: #selector(handleAppleSignInButtonPress), for: .touchUpInside)
        
        // Set constraints and layout
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(titleLabel)
        self.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            // Sign In Button Constraints
            signInButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 44),
            signInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    @objc
    private func handleAppleSignInButtonPress() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

// MARK: - ASAuthorizationControllerDelegate
extension SignInView: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Handle successful sign in here
            // You can access the user's full name and email if available
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error here
    }
}

// MARK: - ASAuthorizationControllerPresentationContextProviding
extension SignInView: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.window!
    }
}
