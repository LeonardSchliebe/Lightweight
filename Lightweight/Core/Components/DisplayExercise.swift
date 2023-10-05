//
//  DisplayExercise.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 05.10.23.
//

import SwiftUI

struct DisplayExercise: View {
    
    let name : String
    let Set1 : String
    let Set2 : String
    let Set3 : String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                
            HStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(Set1)
                        .padding(.vertical)
                      
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(Set2)
                        .padding(.vertical)
                      
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    Text(Set3)
                        .padding(.vertical)
                      
                }
            }
        }
        .padding(.horizontal)
    }
}

struct DisplayExercise_Previews: PreviewProvider {
    static var previews: some View {
        DisplayExercise(name: "Bench",
                        Set1: "Set 1",
                        Set2: "Set 2",
                        Set3: "Set 3")
    }
}
