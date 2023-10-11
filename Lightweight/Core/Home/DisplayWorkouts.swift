//
//  DisplayWorkouts.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI

struct DisplayWorkouts: View {
    var body: some View {
        
        let screenHeigt = UIScreen.main.bounds.size.height
        

        ZStack{
            Rectangle()
                .foregroundColor(Color("Accent").opacity(0.8))
                .cornerRadius(10)
            
            VStack{
                HStack {
                    VStack (alignment: .leading, spacing: 2){
                        Text("Workout X")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                        VStack {
                            Text("\(Image(systemName: "square.and.arrow.up.circle"))").font(.largeTitle)
                                .foregroundColor(Color("Text"))
                        }
                        .padding(.trailing)
                    
                    
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                        .frame(height: screenHeigt * 0.2)
                    
                    Text("Preview - insert background immage")
                        .font(.headline)
                        .padding(.horizontal)
                    
                }
                .padding(.horizontal)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                    
                    Text("\(Image(systemName: "trash")) Exercise")
                        .font(.headline)
                        .padding()
                    
                }
                .padding([.leading, .bottom, .trailing])
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 6.0)
    }
}

struct DisplayWorkouts_Previews: PreviewProvider {
    static var previews: some View {
        DisplayWorkouts()
    }
}

