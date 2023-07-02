//
//  DeviceCard.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI

struct DeviceCard: View {
    var body: some View {
        NavigationLink(destination: {
            ListView()
        }, label: {
            ZStack {
                Color.white
                    .cornerRadius(20)
                
                
                VStack {
                   
                    HStack {
                        Image("sensor")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                    
                        Text("STBP_04")
                            .font(.title)
                            .foregroundColor(.black)
                        Spacer()
                            
                    }
                    .padding(.horizontal)
                    divider
                    HStack {
                        Image(systemName: "cellularbars")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                            .fixedSize()
                            .foregroundColor(.gray)
                        Text("-45 dBm")
                            
                        Spacer()
                        Text("F2:AC:25:E3:D9:EE")
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                }
            }
            .shadow(radius: 8)
        })
        .frame(maxHeight: 210)
        .padding(.horizontal, 20)
    }
    
    private var divider: some View {
        return Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .padding(.horizontal)
    }
}

struct DeviceCard_Previews: PreviewProvider {
    static var previews: some View {
        DeviceCard()
    }
}
