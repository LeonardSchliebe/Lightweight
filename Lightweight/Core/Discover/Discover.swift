//
//  Discover.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 13.09.23.
//

import SwiftUI

struct Discover: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("Our Recomendations:")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.top, .leading, .trailing])
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack{
                    DisplayWorkouts()
                    DisplayWorkouts()
                    DisplayWorkouts()
                }
            }
            HStack {
                Text("Friend X's Workouts:")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.top, .leading, .trailing])
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack{
                    DisplayWorkouts()
                    DisplayWorkouts()
                    DisplayWorkouts()
                }
            }
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        Discover()
    }
}
