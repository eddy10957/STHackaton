//
//  ListView.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI



struct ListView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        VStack {
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
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        HStack {
                            Image(systemName: "chevron.left")
                        }
                        .foregroundColor(.white)
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text("Connected Board")
                        .foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image("img_edit")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image("img_gear")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    })
                }
            }
            .modifier(ColoredNavBar())
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
