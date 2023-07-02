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
                    NavigationLink {
                        view(for: demo)
                    } label: {
                        DemoCardView(demo: demo)
                    }

                    
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
    
    @ViewBuilder
      func view(for destination: Demo?) -> some View {
        switch destination {
        case .some(.walking):
          ContentView()
        case .some(.enviromental):
            EmptyView()
        case .some(.plotData):
            EmptyView()
        case .some(.boardConfiguration):
            EmptyView()
        case .some(.flow):
            EmptyView()
        case .some(.gestureNavigation):
            EmptyView()
        case .some(.textualMonitor):
            EmptyView()
        case .some(.cloudLogging):
            EmptyView()
        case .some(.battery):
            EmptyView()
        default:
          EmptyView()
        }
      }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
