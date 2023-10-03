//
//  RootView.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 02.10.23.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack {
                MainTabView(showSignInView: $showSignInView)
            }
        }.onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
        } .fullScreenCover(isPresented: $showSignInView) {
            AuthenticationView(showSignInView: $showSignInView)
        }
    }
}



struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
