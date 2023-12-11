//
//  Storage.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 11.12.23.
//

import SwiftUI

struct Storage: View {
    var body: some View {
        // from SettingsView
        ZStack {
            Rectangle()
                .foregroundColor(Color("Accent").opacity(0.8))
                .cornerRadius(10)
            
            VStack{
                // Title "Profile"
                
                // Name / Stats
                HStack{
                    // Name / membership stat
                    VStack (alignment: .leading, spacing: 2){
                        //name
                        Text("Johannes")
                            .font(.callout)
                            .fontWeight(.semibold)
                        //username
                        Text("@Johannes")
                            .font(.callout)
                            .fontWeight(.light)
                        //membership stat
                        Text("Member Since:")
                            .font(.callout)
                        Text("XX/XX/XXXX")
                            .font(.callout)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // friends/workouts counter
                    HStack{
                        // Friends
                        UserStatView(value:4, title:"Friends", width:60)
                        // Workouts
                        UserStatView(value:7, title:"Workouts", width:75)
                        
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 6)
                
                //edit profile (action button)
                Button {
                    //FILL
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.all, 5.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }
        .padding(4)
    }
}

#Preview {
    Storage()
}
