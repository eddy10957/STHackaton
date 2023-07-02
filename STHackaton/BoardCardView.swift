//
//  bbb.swift
//  STHackaton
//
//  Created by Raffaele Siciliano on 02/07/23.
//

import SwiftUI

struct BoardCardView: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
            VStack{
                HStack {
                    Text("STBP_04")
                    Spacer()
                }
                .padding(.leading)
                HStack{
                    Image("sensor")
                        .resizable()
                        .scaledToFit()
                        .frame(width:120)
                }
            }
        }
        .frame(height: 175)
        .cornerRadius(10)
    }
}

struct BoardCardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardCardView()
    }
}
