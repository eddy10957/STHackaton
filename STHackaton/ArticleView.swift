//
//  ArticleView.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import SwiftUI

struct ArticleView: View {
    @State var suggestion : Suggestion
    var body: some View {
        NavigationView{
            
            ScrollView{
                VStack(alignment: .leading){
                    suggestion.image
                        .resizable()
                        .scaledToFit()
                    Text(suggestion.title)
                        .font(.title)
                        .bold()
                    Text(suggestion.text)
                        .font(.body)
                }
                .padding()
            }
            .navigationTitle(suggestion.title)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(suggestion: Suggestion(title: "Walking Rehab: Empowering Steps Towards Recovery", text: """
        Walking is a fundamental part of our daily lives, allowing us to move freely and independently. However, for those undergoing rehabilitation due to injury or illness, regaining walking ability can be a challenging and transformative journey. Walking rehab is a process that aims to restore mobility, strength, and confidence, empowering individuals to reclaim their independence.
        
        The journey of walking rehab may vary for each person, as it depends on the specific condition and individual circumstances. It often involves a combination of exercises, therapies, and personalized treatment plans designed to address the underlying causes and challenges hindering walking ability.
        
        One of the primary goals of walking rehab is to improve strength, balance, and coordination. Physical therapists and healthcare professionals work closely with individuals, guiding them through targeted exercises and techniques to enhance muscle function, joint stability, and overall mobility. As progress is made, individuals can gradually increase the intensity and complexity of their exercises, continuously challenging their abilities.
        """, image: Image("walking_rehab_image")))
    }
}
