//
//  DeviceListView.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI

struct DeviceListView: View {
    
    var body: some View {
        NavigationView{
            ScrollView{
                Text("Welcome to ST BLE Sensor App!")
                Text("Click on a board below to access it's demos.")
                NavigationLink {
                    ListView()
                } label: {
                    DeviceCard()
                }

                
            }
            .navigationTitle("Available Boards")
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(Color.accentColor, for: .navigationBar)
        }
    }
}

struct DeviceListView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceListView()
    }
}
