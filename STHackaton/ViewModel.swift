//
//  ViewModel.swift
//  STHackaton
//
//  Created by Edoardo Troianiello on 02/07/23.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    
    @Published var data: [PatientData] = [
        PatientData(patient: "Normal Person", month: 1, steadiness: 0.80),
        PatientData(patient: "Normal Person", month: 3, steadiness: 0.85),
        PatientData(patient: "Normal Person", month: 5, steadiness: 0.83),
        PatientData(patient: "Normal Person", month: 7, steadiness: 0.87),
        PatientData(patient: "Normal Person", month: 9, steadiness: 0.90),
        PatientData(patient: "Normal Person", month: 11, steadiness: 0.93),
        PatientData(patient: "Normal Person", month: 12, steadiness: 0.93),
        
        PatientData(patient: "You", month: 1, steadiness: 0.49),
        PatientData(patient: "You", month: 3, steadiness: 0.55),
        PatientData(patient: "You", month: 5, steadiness: 0.52),
        PatientData(patient: "You", month: 7, steadiness: 0.59),
        PatientData(patient: "You", month: 9, steadiness: 0.64),
        PatientData(patient: "Prediction", month: 9, steadiness: 0.64),
        PatientData(patient: "Prediction", month: 11, steadiness: 0.66),
        PatientData(patient: "Prediction", month: 12, steadiness: 0.70),
    ]
    
    @Published var suggestions :[Suggestion] = [
        Suggestion(title: "Walking Rehab: Empowering Steps Towards Recovery", text: """
        Walking is a fundamental part of our daily lives, allowing us to move freely and independently. However, for those undergoing rehabilitation due to injury or illness, regaining walking ability can be a challenging and transformative journey. Walking rehab is a process that aims to restore mobility, strength, and confidence, empowering individuals to reclaim their independence.
        
        The journey of walking rehab may vary for each person, as it depends on the specific condition and individual circumstances. It often involves a combination of exercises, therapies, and personalized treatment plans designed to address the underlying causes and challenges hindering walking ability.
        
        One of the primary goals of walking rehab is to improve strength, balance, and coordination. Physical therapists and healthcare professionals work closely with individuals, guiding them through targeted exercises and techniques to enhance muscle function, joint stability, and overall mobility. As progress is made, individuals can gradually increase the intensity and complexity of their exercises, continuously challenging their abilities.
        """, image: Image("walking_rehab_image"))
        
    ]
}
