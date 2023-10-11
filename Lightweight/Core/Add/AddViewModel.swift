//
//  AddViewModel.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 01.10.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddViewModel: ObservableObject {
    @Published var showAddExercise = false
    @Published var showAddWorkout = false
    
    init() {}
    
    func deleteWorkout() {
        
        let db = Firestore.firestore()
        
        guard let uId = Auth.auth().currentUser?.uid else
            {
            return
        }
        
        //clear add workout
        db.collection("users")
            .document(uId)
            .collection("Add Workout").getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents:\(error)")
                }else {
                    for document in querySnapshot!.documents {
                        let date = document.documentID
                        
                        db.collection("users")
                            .document(uId)
                            .collection("Add Workout")
                            .document(date)
                            .delete()
                    }
                }
            }
        
        
        
    }
    
   
}
