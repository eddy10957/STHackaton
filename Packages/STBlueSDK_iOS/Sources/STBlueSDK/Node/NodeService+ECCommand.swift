//
//  NodeService+ECCommand.swift
//  
//  Copyright (c) 2022 STMicroelectronics.
//  All rights reserved.
//
//  This software is licensed under terms that can be found in the LICENSE file in
//  the root directory of this software component.
//  If no LICENSE file comes with this software, it is provided AS-IS.
//

import Foundation
import CoreBluetooth

internal extension NodeService {

    func sendCommand(_ command: JsonCommand, feature: Feature) -> Bool {

        guard let json = command.json,
              let blueChar = node.characteristics.characteristic(with: feature),
              blueChar.characteristic.isCharacteristicCanBeWrite else {
                  return false
        }
        
        return sendJSONCommand(json, characteristic: blueChar.characteristic) {}
    }

    func sendCommand(_ command: JsonCommand, blueChar: BlueCharacteristic) -> Bool {

        guard let json = command.json,
              blueChar.characteristic.isCharacteristicCanBeWrite,
              blueChar.characteristic.isExtendedFeatureCaracteristics else {
                  return false
        }
        return sendJSONCommand(json, characteristic: blueChar.characteristic) {}
    }

    func sendJSONCommand(_ json: String, characteristic: CBCharacteristic, _ completion: @escaping () -> Void) -> Bool {
        if debug { STBlueSDK.log(text: "Send command: \(json)") }

        let dataTransporter = DataTransporter()

        return sendWrite(dataTransporter.encapsulate(string: json), characteristic: characteristic, completion: completion)
    }

    @discardableResult
    func sendWrite(_ data: Data, characteristic: CBCharacteristic, completion: @escaping () -> Void) -> Bool {

        writeDataManager.enqueueCommand(WriteDataManager.WriteData(data: data,
                                                                   charactheristic: characteristic,
                                                                   completion: { _ in
            completion()
        }))

        return true
    }
}
