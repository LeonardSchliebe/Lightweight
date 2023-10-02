//
//  Home.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 03.08.23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            VStack{
                
                DisplayWorkouts()
                DisplayWorkouts()
                DisplayWorkouts()
                
            }
            
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
