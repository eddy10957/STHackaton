//
//  Styling.swift
//  STHackaton
//
//  Created by Raffaele Siciliano on 02/07/23.
//

import Foundation
import SwiftUI


extension View {
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
    
        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
    
        return self
    }
}
struct ColoredNavBar: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .navigationBarTitleTextColor(.white)
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(Color.accentColor, for: .navigationBar)
        } else {
            content.onAppear {
                UINavigationBar.appearance().backgroundColor = UIColor(named: "AccentColor")
                UIBarButtonItemAppearance().normal.titleTextAttributes = [.foregroundColor : UIColor.white]
            }
            .onDisappear {
                UINavigationBar.appearance().backgroundColor = .systemGroupedBackground
            }
        }
    }
}
