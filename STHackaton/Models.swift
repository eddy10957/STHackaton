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


public enum Demo: String, CaseIterable, Codable {
    
case walking
case enviromental
case plotData
case boardConfiguration
case flow
case gestureNavigation
case textualMonitor
case cloudLogging
case battery
    
}

public extension Demo {
    
    var color: Color {
        switch self {
        case .walking:
            return .blue
        case .enviromental:
            return .yellow
        case .plotData:
            return .blue
        case .boardConfiguration:
            return .yellow
        case .flow:
            return .blue
        case .gestureNavigation:
            return .yellow
        case .textualMonitor:
            return .blue
        case .cloudLogging:
            return .yellow
        case .battery:
            return .blue
        }
    }
    
    var title: String {
        switch self {
        case .walking:
            return "Walking Rehabilitation"
        case .enviromental:
            return "Enviromental"
        case .plotData:
            return "Plot Data"
        case .boardConfiguration:
            return "Board Configuration"
        case .flow:
            return "Flow"
        case .gestureNavigation:
            return "Gesture Navigation"
        case .textualMonitor:
            return "Textual Monitor"
        case .cloudLogging:
            return "Cloud Logging"
        case .battery:
            return "Battery"
        }
    }
    
    var description: String {
        switch self {
        case .walking:
            return "Keep track of your rehabilitation journey"
        case .enviromental:
            return "Display available temperature, pressure, humidity and Lux sensors values"
        case .plotData:
            return "Display the sensors' value on a configurable plot"
        case .boardConfiguration:
            return "Advance board extended configuration trough json-like messages"
        case .flow:
            return "Create a new application"
        case .gestureNavigation:
            return "Recognition of gesture navigation using sensor"
        case .textualMonitor:
            return "Show in a textual way the values received and parsed from any bluetooth characteristics"
        case .cloudLogging:
            return "Connect the voard to different cloud providers"
        case .battery:
            return "Display board RSSI and Battery information if available"
        }
    }
    
    var imageName: String {
        switch self {
        case .walking:
            return "demo_pedometer"
        case .enviromental:
            return "demo_environmental"
        case .plotData:
            return "demo_charts"
        case .boardConfiguration:
            return "ext_config"
        case .flow:
            return "demo_flow"
        case .gestureNavigation:
            return "demo_gesture_navigation"
        case .textualMonitor:
            return "demo_textual"
        case .cloudLogging:
            return "demo_cloud"
        case .battery:
            return "demo_battery"
        }
        
    }
    
    
}
