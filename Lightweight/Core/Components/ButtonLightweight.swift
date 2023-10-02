//
//  ButtonLightweight.swift
//  Lightweight
//
//  Created by Johannes Heuer-Gerstmann on 01.10.23.
//

import SwiftUI

struct ButtonLightweight: View {
    let title: String
    let action: ()  -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("Accent"))
                    .cornerRadius(10)
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
            }
            .padding(.horizontal)
        }
    }
}

struct ButtonLightweight_Previews: PreviewProvider {
    static var previews: some View {
        ButtonLightweight(title: "abc"){
            //action
        }
    }
}
