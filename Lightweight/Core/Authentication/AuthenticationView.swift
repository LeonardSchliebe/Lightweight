//
//  Authentication View.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 13.09.23.
//

import SwiftUI

final class signInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var showError = false
    @Published var error = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or Password")
            showError = true
            error = "Input email and password"
            return
        }
        
        guard email.contains("@") else {
            print("Enter a valid email")
            showError = true
            error = "Enter a valid email"
            return
        }
        
        guard password.count>5 else {
            print("Min. Password length is 5")
            showError = true
            error = "Minimum password length is 5"
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or Password")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
}

struct AuthenticationView: View {
    @StateObject private var viewModel = signInEmailViewModel()
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            
            TextField("Email...", text: $viewModel.email)
                .padding()
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .background(Color("Accent").opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color("Accent").opacity(0.4))
                .cornerRadius(10)
            
            Button {
                Task{
                    do {
                        try await viewModel.signUp()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                    
                    do {
                        try await viewModel.signIn()
                        showSignInView = false
                        return
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Sign Up or Log In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("Accent"))
                    .cornerRadius(10)
            }
            
            if viewModel.showError {
                Text(viewModel.error)
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("Accent"))
                    .cornerRadius(10)
            }
            
            Spacer()
        }.padding()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(showSignInView: .constant(false))
    }
}
