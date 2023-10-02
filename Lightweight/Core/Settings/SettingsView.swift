//
//  SettingsView.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws {
        guard !email.isEmpty else {
            print("No email")
            return
        }
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        guard !password.isEmpty else {
            print("No Password")
            return
        }
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
}


struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @State private var showingAlert = false
    @Binding var showSignInView: Bool
    
    var body: some View {
        ScrollView{
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                
                Button {
                    Task {
                        do {
                            try viewModel.signOut()
                            showSignInView = true
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Sign Out")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.all, 5.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                        .padding()
                }
            }.padding(4)
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                
                Button {
                    Task {
                        do {
                            try await viewModel.resetPassword()
                            showingAlert = true
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Reset Password")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.all, 5.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                        .padding()
                }.alert("Email with Password Reset Sent!", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) {}
                }
            }.padding(4)
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                
                VStack {
                    TextField("Email...", text: $viewModel.email)
                        .padding()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                    
                    Button {
                        Task {
                            do {
                                try await viewModel.updateEmail()
                                showingAlert = true
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        Text("Update Email")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                            .padding()
                    }.alert("Email Updated!", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
            }.padding(4)
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                
                VStack{
                    SecureField("Password...", text: $viewModel.password)
                        .padding()
                        .cornerRadius(10)
                    
                    Button {
                        Task {
                            do {
                                try await viewModel.updatePassword()
                                showingAlert = true
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        Text("Update Password")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                            .padding()
                    }.alert("Password Updated!", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {}
                    }
                }
            }.padding(4)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSignInView: .constant(false))
    }
}

