//
//  DisplayWorkouts.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift

struct DisplayWorkouts: View {
    @StateObject var viewmodel = DisplayWorkoutsViewModel()
    let item: WorkoutItem
    let userId: String
    
    @FirestoreQuery var exercises: [ExerciseItem]
    
    init(userId: String, item: WorkoutItem){
        self.item = item
        self.userId = userId
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/\(item.name)")
        
    }
    
    var body: some View {
        
        let screenHeigt = UIScreen.main.bounds.size.height
        

        ZStack{
            Rectangle()
                .foregroundColor(Color("Accent").opacity(0.8))
                .cornerRadius(10)
            
            VStack{
                HStack {
                    VStack (alignment: .leading, spacing: 2){
                        Text(item.name)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.top, .leading])
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    VStack{
                        ForEach(exercises) { exercise in
                            DisplayExerciseHome(item: exercise)
                        }
                    }.padding(.vertical)
                }
                .padding(.horizontal)
                Button {
                    viewmodel.deleteWorkout(name: item.name)
                } label:{
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("Accent"))
                            .cornerRadius(10)
                        
                        Text("\(Image(systemName: "trash")) Workout")
                            .font(.headline)
                            .padding()
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 6.0)
    }
}

struct DisplayWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        DisplayWorkouts(userId: "2GmwqX33EOezLiAoPYG1qaGQ9Ar2", 
                        item: WorkoutItem(id: "",
                                          date: Date().timeIntervalSince1970,
                                          name: "Safety"))
    }
}

