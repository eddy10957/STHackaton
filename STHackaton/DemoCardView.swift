//
//  DemoCardView.swift
//  STHackaton
//
//  Created by Raffaele Siciliano on 02/07/23.
//

import SwiftUI

struct DemoCardView: View {
    @State var demo : Demo
    var body: some View {
        HStack {
            ZStack {
                demo.color
                    .opacity(0.8)
                Image(demo.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
            }
            .frame(width: 80, height: 80)
            .cornerRadius(10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(demo.title)
                    Spacer()
                }
                
                Text(demo.description)
                    .font(.system(size: 10))
                    .padding(.vertical, 10)
            }
        }
    }
}

//struct DemoCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoCardView()
//    }
//}
