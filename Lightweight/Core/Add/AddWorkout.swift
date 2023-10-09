//
//  AddWorkout.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 09.10.23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestoreSwift

struct AddWorkout: View {
    @StateObject var viewModel = AddWorkoutViewModel()
    @Binding var AddWorkoutPresented: Bool
    
    var body: some View {
        VStack {
            Text("Save Workout")
                .font(.largeTitle)
                .bold()
            Form {
                TextField("Name", text: $viewModel.name)
                ButtonLightweight(title: "Add Workout"){
                    if viewModel.canSave {
                        viewModel.save()
                        AddWorkoutPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Add Workout Alert"))
            }
            
                
            
        }
    }
}

struct AddWorkout_Previews: PreviewProvider {
    static var previews: some View {
        AddWorkout(AddWorkoutPresented: Binding(get: {
            return  true
        }, set: { _ in
            
        }))
    }
}
