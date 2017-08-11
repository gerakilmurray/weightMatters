//
//  AddWeightViewController.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import UIKit

protocol AddWeightViewControllerDelegate {
    func addWeight(record: WeightRecord) -> Void
}

class AddWeightViewController: UIViewController {

    @IBOutlet weak var weightTextInput: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var currentMeasure = WeightMeasure.kilogram
    var delegate: AddWeightViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.currentMeasure == WeightMeasure.kilogram {
            weightTextInput.placeholder = "in kilograms"
        }
        else {
            weightTextInput.placeholder = "in pounds"
        }
    }
    
    @IBAction func btnSaveTapped(_ sender: Any) {
        if let weightText = self.weightTextInput.text, let aWeight = Double(weightText) {
            let aDate = self.datePicker.date
            let newWeightRecord = WeightRecord(date: aDate, weight: aWeight, measure: self.currentMeasure)
            self.delegate?.addWeight(record: newWeightRecord)
            back()
        }
        else{
            showAlert()
        }
    }
    
    func back() -> Void {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert() -> Void {
        // Create Alert
        let alert = UIAlertController(title: "Weight empty", message: "Please add a weight", preferredStyle: UIAlertControllerStyle.alert)
        
        // Create Action
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        // Present
        self.present(alert, animated: true, completion: nil)
    }
}
