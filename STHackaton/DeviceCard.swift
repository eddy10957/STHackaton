//
//  DeviceCard.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI
import STBlueSDK

struct DeviceCard: View {
    
    @State var node : Node
    
    var body: some View {
        NavigationLink(destination: {
            ListView(node: node)
        }, label: {
            ZStack {
                Color.white
                    .cornerRadius(20)
                
                
                VStack {
                   
                    HStack {
                        Image("sensor")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 60)
                    
                        Text(node.name!)
                            .font(.title)
                            .foregroundColor(.black)
                        Spacer()
                        Image(systemName: "pin")
                            .padding(.bottom, 70)
                            
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
                        Text("\(node.rssi!) dBm")
                            
                        Spacer()
                        Text(node.address!)
                    }
                    .padding(.horizontal)
                }
            }
            .shadow(radius: 8)
        })
        .frame(height: 170)
        .padding(.horizontal, 10)
    }
    
    private var divider: some View {
        return Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
            .padding(.horizontal)
    }
}

//struct DeviceCard_Previews: PreviewProvider {
//    static var previews: some View {
//        DeviceCard()
//    }
//}
