//
//  WeigthRecordDAO.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import UIKit
import CoreData

class WeightRecordDAO {
    private let userDefaultsKey = "weightList"
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let storeContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // MARK: User Defaults
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
            if let date = dateStr.convert2Date(format: Date.formatDateString) {
                let weightRecord = WeightRecord(date: date, weight: weight, measure: WeightMeasure.kilogram)
                array.append(weightRecord)
            }
        }

        return array
    }
    
    // MARK: CoreData
    func getAllWeightsCodeData() -> [WeightRecord] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CDWeightRecord")
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        return fetchCoreDataRequest(request: request)
    }
    
    func save(weight record: WeightRecord) -> Void {
        if let date = record.date, let weight = record.weightInKilogrames {
            let cdWeightRecord = NSEntityDescription.insertNewObject(forEntityName: "CDWeightRecord", into: storeContext) as! CDWeightRecord
            cdWeightRecord.date = date
            cdWeightRecord.weight = weight
            // Store the record in CoreData
            appDelegate.saveContext()
        }
    }
    
    private func fetchCoreDataRequest(request: NSFetchRequest<NSFetchRequestResult>) -> [WeightRecord] {
        do {
            let cdObjects = try storeContext.fetch(request) as! [CDWeightRecord]
            var objectsDTO = [WeightRecord]()
            for cdObject in cdObjects {
                let objectDTO = WeightRecord(fromCoreData: cdObject)
                objectsDTO.append(objectDTO)
            }
            return objectsDTO
        }
        catch {
            print("Hubo un error al querer leer 'CDGenre' desde CoreData")
        }
        return []
    }

}
