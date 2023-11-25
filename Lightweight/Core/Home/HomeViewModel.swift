//
//  HomeViewModel.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 25.11.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import Foundation

class HomeViewModel: ObservableObject {
    func getWorkouts(userID: String) -> [WorkoutItem] {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(userID)
        docRef.getDocument { (document, error) in
          if let document = document, document.exists {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          } else {
            print("Document does not exist")
          }
        }
        return dataDescription
    }
}
