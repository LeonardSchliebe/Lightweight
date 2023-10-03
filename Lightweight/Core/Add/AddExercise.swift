//
//  AddExercise.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 01.10.23.
//

import SwiftUI

struct AddExercise: View {
    @StateObject var viewModel = AddExerciseViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack {
            Text ("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 20)
            Form {
                TextField("Name", text: $viewModel.title)
                
                TextField("Set 1", text: $viewModel.set1)
                TextField("Set 2", text: $viewModel.set2)
                TextField("Set 3", text: $viewModel.set3)
                
                ButtonLightweight(
                    title: "Add Exercise"){
                        if viewModel.canSave {
                            viewModel.save()
                            newItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                .padding()
                
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Please give a Name and at least the first Set"))
            }
        }
    }
}

struct AddExercise_Previews: PreviewProvider {
    static var previews: some View {
        AddExercise(newItemPresented: Binding(get: {
            return  true
        }, set: { _ in
            
        }))
    }
}
