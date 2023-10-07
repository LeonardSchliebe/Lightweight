//
//  DisplayExercise.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 05.10.23.
//

import SwiftUI

struct DisplayExercise: View {
    
    let item: ExerciseItem
        
    var body: some View {
        VStack {
            Text(item.name)
                .font(.headline)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                
            HStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(item.set1)
                        .padding(.vertical)
                      
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(item.set2)
                        .padding(.vertical)
                      
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(item.set3)
                        .padding(.vertical)
                      
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DisplayExercise_Previews: PreviewProvider {
    static var previews: some View {
        DisplayExercise(item: ExerciseItem(id: "",
                                           date: Date().timeIntervalSince1970,
                                           name: "",
                                           set1: "",
                                           set2: "",
                                           set3: ""))
    }
}
