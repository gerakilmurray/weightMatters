//
//  SettingsViewController.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func updateMeasure(with measure: WeightMeasure) -> Void
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var measureSelection: UISegmentedControl!
    
    var currentMeasure: WeightMeasure?
    var delegate: SettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        measureSelection.selectedSegmentIndex = currentMeasure?.rawValue ?? 0
    }
    
    @IBAction func measureSelectedChanged(_ sender: UISegmentedControl) {
        var measure = WeightMeasure.kilogram
        if sender.selectedSegmentIndex == WeightMeasure.pound.rawValue {
            measure = WeightMeasure.pound
        }
        self.delegate?.updateMeasure(with: measure)
        back()
    }
    
    @IBAction func btnCancelTapped() {
        back()
    }
    
    func back() -> Void {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
