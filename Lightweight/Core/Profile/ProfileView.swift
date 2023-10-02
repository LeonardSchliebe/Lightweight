//
//  ProfileView.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 31.07.23.
//

import SwiftUI

struct ProfileView: View {    
    var body: some View {
        ScrollView{
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
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
            

            
            HStack{
                Text("Your Statisitics:")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                HStack{
                    Text("W")
                    Text("M")
                    Text("Y")
                }
                .padding(3.0)
                .padding(.horizontal, 2.0)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Text"), lineWidth: 3))
                    
                
                
            }
            .padding([.top, .leading, .trailing])
            
            
            
            WorkoutStatView(value: 5, title: "Unique Workouts Performed")
            WorkoutStatView(value: 126, title: "Minutes Worked out")
            WorkoutStatView(value: 2, title: "New Workouts tried")
            WorkoutStatView(value: 4, title: "Workouts shared")
            
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                
                Button {
                    //FILL
                } label: {
                    Text("Invite a friend")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.all, 5.0)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.black)
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
                        .padding()
                }
                
            }
            .padding(4)
            
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

