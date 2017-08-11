//
//  WeigthRecordService.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import Foundation

class WeightRecordService {
    func getAllWeights() -> [WeightRecord] {
        let dao = WeightRecordDAO()
        return dao.getAllWeightsCodeData()
    }
    
    func saveWeights(list weights: [WeightRecord]) -> Void {
        let dao = WeightRecordDAO()
        dao.saveWeightsUserDefaults(list: weights)
    }
    
    func save(weight record: WeightRecord) -> Void {
        let dao = WeightRecordDAO()
        dao.save(weight: record)
    }
}
