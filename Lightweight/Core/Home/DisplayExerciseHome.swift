//
//  DisplayExerciseHome.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 09.12.23.
//

import SwiftUI

struct DisplayExerciseHome: View {
    let item: ExerciseItem
    
    var body: some View {
        VStack {
            Text(item.name)
                .font(.headline)
                .foregroundColor(Color("SecondaryText"))
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                
            HStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(item.set1)
                        .padding(.vertical, 6.0)
                      
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(item.set2)
                        .padding(.vertical, 6.0)
                      
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(item.set3)
                        .padding(.vertical, 6.0)
                      
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    DisplayExerciseHome(item: ExerciseItem(id: "",
                                           date: Date().timeIntervalSince1970,
                                           name: "",
                                           set1: "",
                                           set2: "",
                                           set3: ""))
}
