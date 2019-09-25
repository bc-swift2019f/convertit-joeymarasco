//
//  ViewController.swift
//  Convert It
//
//  Created by Joseph Marasco on 9/24/19.
//  Copyright © 2019 Joseph Marasco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var fromUnitsLabel: UILabel!
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var formulaPickerView: UIPickerView!
    
    
    
    var formulaArray = ["Miles to Kilometers",
                        "Kilometers to Miles",
                        "Meters to feet",
                        "Yards to Meters",
                        "Meters to Yards"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPickerView.delegate = self
        formulaPickerView.dataSource = self
    }


    @IBAction func convertButtonPressed(_ sender: UIButton) {
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return formulaArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulaArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fromUnitsLabel.text = formulaArray[row]
    }
}


