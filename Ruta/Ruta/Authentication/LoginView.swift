//
//  LoginView.swift
//  Ruta
//
//  Created by Aaron on 06/12/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()


            Button("Login") {
                // Login logic here
                self.isActive = true
            }

            // Social media login buttons here

            Button("Don't have an account?") {
                // Navigate to Signup Screen
            }
        }
        .fullScreenCover(isPresented: $isActive, content: HomeView.init)
    }
}
#Preview {
    LoginView()
}

