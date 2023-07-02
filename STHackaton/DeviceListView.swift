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
                VStack {
                Text("Welcome to ST BLE Sensor App!")
                    .foregroundColor(.gray)
                Text("Click on a board below to access it's demos.")
                    .foregroundColor(.gray)
            }
                    .padding(.vertical)
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
