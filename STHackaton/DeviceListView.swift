//
//  DeviceListView.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI
import STBlueSDK

struct DeviceListView: View {
    @State var discoveredNodes : [Node] = []
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isRotated = false
    var animation: Animation {
        Animation.easeOut
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                ScrollView{
                    VStack {
                        Text("Welcome to ST BLE Sensor App!")
                            .foregroundColor(.gray)
                        Text("Click on a board below to access it's demos.")
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                    ForEach(discoveredNodes, id: \.deviceId){ node in
                        NavigationLink {
                            ListView(node: node)
                        } label: {
                            DeviceCard(node: node)
                        }
                    }
                }
                VStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: 700)
                    Spacer()
                    Button {
                        self.isRotated.toggle()
                        // Refresh the list
                    } label: {
                        ZStack {
                            Color.cyan
                            Image("img_refresh")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFit()
                                .foregroundColor(.black)
                                .rotationEffect(Angle.degrees(isRotated ? 300 : 0))
                                .animation(animation)
                                .padding(5)
                        }
                        .frame(width: 200)
                        .clipShape(Circle())
                    }
                    .padding(.bottom, 20)
                }
                //                .padding(.top, 600)
                
            }
            .navigationTitle("Available Boards")
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.accentColor, for: .navigationBar)
            .onAppear{
                BlueManager.shared.discoveryStop()
                BlueManager.shared.resetDiscovery()
                BlueManager.shared.discoveryStart()
            }
            .onReceive(timer){ _ in
                discoveredNodes = BlueManager.shared.discoveredNodes
            }
        }
    }
}

struct DeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceListView()
    }
}
