//
//  DisplayWorkoutsViewModel.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 09.12.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class DisplayWorkoutsViewModel: ObservableObject {
    init () {}
    
    func deleteWorkout(name: String){
        let db = Firestore.firestore()
        
        guard let uId = Auth.auth().currentUser?.uid else
        {
            return
        }
        db.collection("users")
            .document(uId)
            .collection("\(name)").getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                }else {
                    for document in querySnapshot!.documents {
                        let date = document.documentID
                        
                        db.collection("users")
                            .document(uId)
                            .collection("\(name)")
                            .document(date)
                            .delete()
                    }
                    db.collection("users")
                        .document(uId)
                        .collection("ExistingWorkouts")
                        .document("\(name)")
                        .delete()
                }
                
            }
    }
    
    
}
