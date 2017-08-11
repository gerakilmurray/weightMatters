//
//  WeightTableViewCell.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import UIKit

class WeightTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    func setup(with weight: WeightRecord, measure: WeightMeasure) -> Void {
        dateLabel.text = weight.date?.toString()
        weightLabel.text = weight.showIn(measure: measure)
    }
}
