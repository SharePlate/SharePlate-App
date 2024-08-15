//
//  HomeView.swift
//  AuthLogin
//
//  Created by Marwa Abou Niaaj on 29/11/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var showLoginSheet = false
    @State private var showDeleteAccountAlert = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                VStack(alignment: .leading) {
                    if authManager.authState == .signedIn {
                        Text(authManager.user?.displayName ?? "Name placeholder")
                            .font(.headline)

                        Text(authManager.user?.email ?? "Email placeholder")
                            .font(.subheadline)
                    }
                    else {
                        Text("Sign-in to view data!")
                            .font(.headline)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(12)
                .padding()

                Spacer()
                Image("homeScreen")
                    .foregroundStyle(Color(.blue))
                    .padding()
                Spacer()

                HStack {
                    // Show `Sign out` iff user is not anonymous,
                    // otherwise show `Sign-in` to present LoginView() when tapped.
                    Button {
                        if authManager.authState != .signedIn {
                            showLoginSheet = true
                        } else {
                            signOut()
                        }
                    } label: {
                        Text(authManager.authState != .signedIn ? "Sign-in" :"Sign out")
                            .font(.body.bold())
                            .frame(width: 150, height: 45, alignment: .center)
                            .foregroundStyle(Color(.yellow))
                            .background(Color(.blue))
                            .cornerRadius(10)
                    }

                    // Delete Account
                    Button {
                        showDeleteAccountAlert = true
                    } label: {
                        Text("Delete Account")
                            .font(.body.bold())
                            .frame(width: 150, height: 45, alignment: .center)
                            .foregroundStyle(.red)
                            .background(Color(.blue))
                            .cornerRadius(10)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.yellow))
            .navigationTitle("Welcome")

            .sheet(isPresented: $showLoginSheet) {
                LoginView()
            }
            
        }
    }

    func signOut() {
        Task {
            do {
                try await authManager.signOut()
            }
            catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthManager())
}
