//
//  ListView.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame( height: 200)
                        .foregroundColor(.white)
                        .border(Color.gray)
                        .shadow(radius: 3)
                    VStack{
                        Text("STBP_04")
                        HStack{
                            Spacer()
                            Image("sensor")
                                .resizable()
                                .scaledToFit()
                                .frame(width:200)
                            Spacer()
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
