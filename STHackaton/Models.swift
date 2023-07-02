//
//  Models.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import Foundation
import SwiftUI

struct PatientData : Identifiable{
    var id : UUID
    var patient: String
    var date: Date
    var steadiness: Double
    
    
    init(patient: String, month: Int, steadiness: Double) {
        self.id = UUID()
        let calendar = Calendar.autoupdatingCurrent
        self.patient = patient
        self.date = calendar.date(from: DateComponents(year: 2023, month: month))!
        self.steadiness = steadiness
    }
}

struct Suggestion : Identifiable{
    var id : UUID
    var title: String
    var text: String
    var image: Image
    
    
    init(title: String, text: String, image: Image) {
        self.id = UUID()
        self.title = title
        self.text = text
        self.image = image
    }
}
