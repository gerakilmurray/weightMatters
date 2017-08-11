//
//  WeigthRecordDAO.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import Foundation

class WeightRecordDAO {
    private let userDefaultsKey = "weightList"    
    
    func getAllWeightsUserDefaults() -> [WeightRecord] {
        let defaults = UserDefaults.standard
        var result = [WeightRecord]()
        if let weightDict = defaults.dictionary(forKey: self.userDefaultsKey) as? [String:Double] {
            result = convert2Array(dict: weightDict)
        }
        return result
    }
    
    func saveWeightsUserDefaults(list weights: [WeightRecord]) -> Void {
        let defaults = UserDefaults.standard
        let weightDict = convert2Dict(list: weights)
        defaults.set(weightDict, forKey: self.userDefaultsKey)
    }
    
    private func convert2Dict(list weights: [WeightRecord]) -> [String:Double] {
        var dict = [String:Double]()
        
        for weightRecord in weights {
            if let date = weightRecord.date?.toString(), let weight = weightRecord.weightInKilogrames {
                dict[date] = weight
            }
        }
        
        return dict
    }
    
    private func convert2Array(dict: [String:Double]) -> [WeightRecord] {
        var array = [WeightRecord]()
        
        for (dateStr, weight) in dict {
            if let date = dateStr.convert2Date(format: "MM/dd/yyyy") {
                let weightRecord = WeightRecord(date: date, weight: weight, measure: WeightMeasure.kilogram)
                array.append(weightRecord)
            }
        }

        return array
    }

}
