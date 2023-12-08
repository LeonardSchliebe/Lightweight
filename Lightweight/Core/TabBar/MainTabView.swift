//
//  MainTabView.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct MainTabView: View {
    
    @Binding var showSignInView: Bool
    
    
    var body: some View {
        TabView{
            Home(userId: "2GmwqX33EOezLiAoPYG1qaGQ9Ar2")
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }

            Add(userId: "2GmwqX33EOezLiAoPYG1qaGQ9Ar2")
                .tabItem{
                    Image(systemName: "plus.app")
                    Text("Add")
                }

            SettingsView(showSignInView: $showSignInView)
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(Color("Text"))

        
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(showSignInView: .constant(false))
    }
}
