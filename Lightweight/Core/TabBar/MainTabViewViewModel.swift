//
//  MainTabViewViewModel.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 11.12.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MainTabViewViewModel: ObservableObject {
    func getUserId() -> String {
        guard let uId = Auth.auth().currentUser?.uid else { return "2GmwqX33EOezLiAoPYG1qaGQ9Ar2" }

        return uId
        
        
    }
}
