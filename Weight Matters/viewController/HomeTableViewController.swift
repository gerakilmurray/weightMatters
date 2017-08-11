//
//  HomeTableViewController.swift
//  Weight Matters
//
//  Created by gera on 8/10/17.
//  Copyright © 2017 Gerardo Kilmurray. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController, AddWeightViewControllerDelegate, SettingsViewControllerDelegate {
    
    private var measure = WeightMeasure.kilogram
    private var weightList = [WeightRecord]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = WeightRecordService()
        weightList = service.getAllWeights()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weightList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weightCell", for: indexPath)

        if let weightCell = cell as? WeightTableViewCell {
            weightCell.setup(with: weightList[indexPath.row], measure: self.measure)
        }

        return cell
    }
    
    // MARK: Navigation
    @IBAction func btnSettingsTapped(_ sender: Any) {
        performSegue(withIdentifier: "settingsSegue", sender: nil)
    }
 
    @IBAction func btnAddWeightTapped(_ sender: Any) {
        performSegue(withIdentifier: "addWeightSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingsViewController = segue.destination as? SettingsViewController {
            settingsViewController.currentMeasure = self.measure
            settingsViewController.delegate = self
        }
        
        if let addWeightViewController = segue.destination as? AddWeightViewController {
            addWeightViewController.currentMeasure = self.measure
            addWeightViewController.delegate = self
        }
    }
    
    
    // MARK: Protocols functions
    func updateMeasure(with measure: WeightMeasure) -> Void {
        self.measure = measure
        self.tableView.reloadData()
    }
    
    func addWeight(record: WeightRecord) -> Void {
        self.weightList.append(record)
        let service = WeightRecordService()
        service.saveWeights(list: self.weightList)
        self.tableView.reloadData()
    }
}
