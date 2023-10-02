//
//  DisplayWorkouts.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI

struct DisplayWorkouts: View {
    var body: some View {
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
                        
                        Text("Last trained xx/xx/xxxx")
                            .font(.callout)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    .padding()
                    NavigationLink(destination: ProfileView()){
                        
                        VStack {
                            Text("\(Image(systemName: "square.and.arrow.up.circle"))").font(.largeTitle)
                        }
                        .padding(.trailing)
                        
                    }
                    .foregroundColor(Color("Text"))
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(Color("Accent"))
                        .cornerRadius(10)
                        .frame(height: 180)
                    
                    Text("Preview - insert background immage")
                        .font(.headline)
                        .padding(.horizontal)
                    
                }
                .padding(.horizontal)
                
                HStack{
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("Accent"))
                            .cornerRadius(10)
                        
                        Text("Edit")
                            .font(.headline)
                            .padding()
                        
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("Accent"))
                            .cornerRadius(10)
                        
                        Text("Train")
                            .font(.headline)
                            .padding()
                        
                    }
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

