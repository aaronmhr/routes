//
//  SignupView.swift
//  Ruta
//
//  Created by Aaron on 06/12/2023.
//

import SwiftUI

struct SignupView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isActive: Bool = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Sign Up") {
                // Sign up logic here
                self.isActive = true
            }

            // Social media sign-up buttons here

            Button("Login") {
                // Navigate to Login Screen
            }
        }
        .fullScreenCover(isPresented: $isActive, content: HomeView.init)
    }
}

#Preview {
    SignupView()
}
