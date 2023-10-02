//
//  UserStatView.swift
//  Lightweight
//
//  Created by Leonard Carl Schliebe on 27.09.23.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    let width: CGFloat
    var body: some View {
        VStack{
            Text("\(value)")
                .fontWeight(.semibold)
            
            Text(title)
        }
        .frame(width:width)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 12, title: "Posts", width: 72)
    }
}

