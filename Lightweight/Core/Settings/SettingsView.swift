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
    
    enum ValidationError: Error {
        case invalidEmail
        case invalidPassword
    }
    
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
        guard !email.isEmpty, email.contains("@") else {
            print("No email")
            throw ValidationError.invalidEmail
        }
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        guard !password.isEmpty, password.count>5 else {
            print("No Password")
            throw ValidationError.invalidPassword
        }
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
}


struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @State private var showingAlertEmail = false
    @State private var showingAlertPassword = false
    @State private var showingAlert = false
    @State private var showingErrorEmail = false
    @State private var showingErrorPassword = false
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        ScrollView{
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                
                VStack{
                    // Title "Profile"
                    
                    // Name / Stats
                    HStack{
                        // Name / membership stat
                        VStack (alignment: .leading, spacing: 2){
                            //name
                            Text("Johannes")
                                .font(.callout)
                                .fontWeight(.semibold)
                            //username
                            Text("@Johannes")
                                .font(.callout)
                                .fontWeight(.light)
                            //membership stat
                            Text("Member Since:")
                                .font(.callout)
                            Text("XX/XX/XXXX")
                                .font(.callout)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // friends/workouts counter
                        HStack{
                            // Friends
                            UserStatView(value:4, title:"Friends", width:60)
                            // Workouts
                            UserStatView(value:7, title:"Workouts", width:75)
                            
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 6)
                    
                    //edit profile (action button)
                    Button {
                        //FILL
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.all, 5.0)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .padding(4)
            
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
                                showingAlertEmail = true
                                showingErrorEmail = false
                            } catch {
                                print("Email update failed with error: \(error)")
                                showingErrorEmail = true
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
                    }.alert("Email Updated!", isPresented: $showingAlertEmail) {
                        Button("OK", role: .cancel) {}
                    }
                }
            }.padding(4)
            
            if showingErrorEmail{
                Text("Invalid Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("Accent"))
                    .cornerRadius(10)
            }
            
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
                                showingAlertPassword = true
                                showingErrorPassword = false
                            } catch {
                                print(error)
                                showingErrorPassword = true
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
                    }.alert("Password Updated!", isPresented: $showingAlertPassword) {
                        Button("OK", role: .cancel) {}
                    }
                }
            }.padding(4)
            
            if showingErrorPassword{
                Text("Invalid Password")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color("Accent"))
                    .cornerRadius(10)
            }
            
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
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSignInView: .constant(false))
    }
}

