//
//  Style.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import Foundation
import SwiftUI

struct PlainGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            configuration.content
        }
    }
}
