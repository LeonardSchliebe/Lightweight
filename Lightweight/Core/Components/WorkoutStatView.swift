//
//  WorkoutStatView.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI

struct WorkoutStatView: View {
    let value: Int
    let title: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("Accent"))
                .cornerRadius(10)
            VStack {
                Text("\(value)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("\(title)")
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
        }
        .padding(4)
    }
}

struct WorkoutStatView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutStatView(value: 4, title: "Workouts Performed")
    }
}
