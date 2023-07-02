//
//  MachineLearningCoreFeature.swift
//  
//  Copyright (c) 2022 STMicroelectronics.
//  All rights reserved.
//
//  This software is licensed under terms that can be found in the LICENSE file in
//  the root directory of this software component.
//  If no LICENSE file comes with this software, it is provided AS-IS.
//

import Foundation

public class MachineLearningCoreFeature: BaseFeature<MachineLearningCoreData> {
    
    let packetLength = 8
    
    override func extractData<T>(with timestamp: UInt64, data: Data, offset: Int) -> FeatureExtractDataResult<T> {
    
        if data.count - offset < packetLength {
            return (FeatureSample(with: timestamp, data: data as? T, rawData: data), 0)
        }
        
        let parsedData = MachineLearningCoreData(with: data, offset: offset, numberOfRegiters: packetLength)
        
        return (FeatureSample(with: timestamp, data: parsedData as? T, rawData: data), packetLength)
    }

}
