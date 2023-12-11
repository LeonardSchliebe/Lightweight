//
//  Add.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 18.08.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift



struct Add: View {
    @StateObject var viewModel = AddViewModel()
    @FirestoreQuery var exercises: [ExerciseItem]
    let screenWidth = UIScreen.main.bounds.size.width

    
    init(userId: String) {
        self._exercises = FirestoreQuery(
            collectionPath: "users/\(userId)/Add Workout")
    }
    var body: some View {
        
        ScrollView {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent").opacity(0.8))
                    .cornerRadius(15)
                VStack{
                    HStack{
                        Text("Workout")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color.black)
                        
                        
                        HStack{
                            Button {
                                viewModel.showAddWorkout = true
                            } label: {
                                Text("\(Image(systemName: "checkmark.circle"))")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }
                            .sheet(isPresented: $viewModel.showAddWorkout){
                                AddWorkout(AddWorkoutPresented: $viewModel.showAddWorkout)
                            }

                            Button {
                                viewModel.deleteWorkout()
                            } label: {
                                Text("\(Image(systemName: "minus.circle"))")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.black)
                            }
                        }
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .font(.largeTitle)
                    
                    Divider()
                        .frame(width: screenWidth * 0.75, height: 4)
                        .overlay(Color("Shadow"))
                    
                    ForEach(exercises) { exercise in
                        DisplayExercise(item: exercise)
                    }
                    
                    Divider()
                        .frame(width: screenWidth * 0.3, height: 4)
                        .overlay(Color("Shadow"))
                        .padding()
                    
                    ScrollView {
                        Button {
                            viewModel.showAddExercise = true
                        } label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(Color("Accent"))
                                    .cornerRadius(10)
                                Text("\(Image(systemName: "plus.square")) Exercise")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .padding(.vertical)
                            }
                            .padding(.horizontal)
                        }
                        .sheet(isPresented: $viewModel.showAddExercise) {
                            AddExercise(newItemPresented:
                                            $viewModel.showAddExercise)
                        }
                    }.scrollDisabled(true)
                }
                .padding(.vertical)
            }
            .padding(.all)
        }.background(Color.background)
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add(userId: "2GmwqX33EOezLiAoPYG1qaGQ9Ar2")
    }
}
