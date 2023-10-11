//
//  AddWorkoutViewModel.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 09.10.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddWorkoutViewModel: ObservableObject {
    @Published var name = ""
    
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        
        let db = Firestore.firestore()
        
        guard canSave else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        

        
        // Transfer from Add Workout to saved workout by name
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
                            .collection(self.name)
                            .document(date)
                            .setData(document.data())
                        
                    }
                }
            }
        
        
        // empty add workout
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
        
        // order by timestamp
        db.collection("users").document(uId).collection(self.name).order(by: "date")
        
        
    }
    
    var canSave: Bool{
        return true
    }
    
    
    
}

