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
        let uId = (Auth.auth().currentUser?.uid)!
        
        return uId
    }
}
