//
//  WeightRecord.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import Foundation

class WeightRecord {
    var date: Date?
    var weightInKilogrames: Double?
    
    init(date: Date, weight: Double, measure: WeightMeasure) {
        self.date = date
        if measure == WeightMeasure.kilogram {
            self.weightInKilogrames = weight
        }
        else {
            self.weightInKilogrames = weight * WeightEquivalent.kilogram2Pound.rawValue
        }
    }
    
    func getInKilogrames() -> Double {
        return self.weightInKilogrames ?? 0.0
    }
    
    func getInPounds() -> Double {
        return (self.weightInKilogrames ?? 0.0) / WeightEquivalent.kilogram2Pound.rawValue
    }
    
    func showIn(measure: WeightMeasure) -> String {
        if measure == WeightMeasure.kilogram {
            return "\(String(format: "%.1f", getInKilogrames())) Kg"
        }
        else {
            return "\(String(format: "%.1f", getInPounds())) Lbs"
        }
    }
}
