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
        let db = Firestore.firestore()
        
        guard canSave else {
            return
        }
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //Create a model
        let newExercise = ExerciseItem(id: UUID().uuidString,
                                       name: title,
                                       set1: set1,
                                       set2: set2,
                                       set3: set3)
        // Save Model
        
        
        db.collection("users")
            .document(uId)
            .collection("Workout 1")
            .document(title)
            .setData(newExercise.asDictionary())
        
        
        
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

