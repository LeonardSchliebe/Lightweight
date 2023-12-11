//
//  Home.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 03.08.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift

struct Home: View {
    @FirestoreQuery var workouts: [WorkoutItem]
    let userId: String
    init (userId: String) {
        self.userId = userId
        self._workouts = FirestoreQuery(
        collectionPath: "users/\(userId)/ExistingWorkouts")
    }
    var body: some View {
 
        ScrollView(showsIndicators: false){
            VStack{
                ForEach (workouts) { workout in
                    DisplayWorkouts(userId: userId, item: workout)
                }
            }
        }.background(Color.background)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(userId: "2GmwqX33EOezLiAoPYG1qaGQ9Ar2")
    }
}
