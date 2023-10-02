//
//  Add.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 18.08.23.
//

import SwiftUI

struct Add: View {
    @StateObject var viewModel = AddViewModel()
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color("Accent").opacity(0.8))
                .cornerRadius(15)
            ScrollView {
                VStack{
                    HStack{
                        Text("Workout name")
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            Text("\(Image(systemName: "checkmark.circle"))")
                                .fontWeight(.bold)
                            Text("\(Image(systemName: "minus.circle"))")
                                .fontWeight(.bold)
                        }
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal)
                    .font(.largeTitle)
                    
                    
                    //grid view of workout
                    

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
                }
                .padding(.vertical)
            }
        }
        .padding([.leading, .bottom, .trailing])
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
    }
}
