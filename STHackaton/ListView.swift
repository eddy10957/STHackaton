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
            ScrollView(showsIndicators: true){
                
                BoardCardView()
                    .padding(3)
                    .shadow(radius: 3)
                    .ignoresSafeArea(.all)
                    .padding(.bottom)
                
                ForEach(Demo.allCases, id: \.self) { demo in
                    DemoCardView(demo: demo)
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
