//
//  AddExerciseViewModel.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 01.10.23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class AddExerciseViewModel: ObservableObject {
    @Published var title = ""
    
    @Published var set1 = ""
    @Published var set2 = ""
    @Published var set3 = ""
    
    @Published  var showAlert = false
    
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create a model
        
        // Save Model
        let db = Firestore.firestore()
        
        
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard !set1.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
        
    }
}

