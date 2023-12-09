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
    @StateObject var viewModel = MainTabViewViewModel()
    
    var body: some View {
        TabView{
            Home(userId: viewModel.getUserId())
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }

            Add(userId: viewModel.getUserId())
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
