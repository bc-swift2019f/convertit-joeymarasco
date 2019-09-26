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
    @IBOutlet weak var decimalSegment: UISegmentedControl!
    
    
    
    var formulaArray = ["Miles to Kilometers",
                        "Kilometers to Miles",
                        "Meters to Feet",
                        "Feet to Meters",
                        "Yards to Meters",
                        "Meters to Yards"]
    
    var fromUnits = ""
    var toUnits = ""
    var conversionString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formulaPickerView.delegate = self
        formulaPickerView.dataSource = self
        conversionString = formulaArray[formulaPickerView.selectedRow(inComponent: 0)]
    }

    
    func calculateConversion() {
        guard let inputValue = Double(userInput.text!) else {
            print("show alert here to say the value entered was not a number")
            return
        }
        var outputValue = 0.0
        switch conversionString {
        case "Miles to Kilometers":
            outputValue = inputValue / 0.62137
        case "Kilometers to Miles":
            outputValue = inputValue * 0.62137
        case "Feet to Meters":
            outputValue = inputValue / 3.2808
        case "Meters to Feet":
            outputValue = inputValue * 3.2808
        case "Yards to Meters":
            outputValue = inputValue / 1.0936
        case "Meters to Yards":
            outputValue = inputValue * 0.62137
        default:
            print("show alert for some reason we didnt have a conversion string")
            }

        let formatString = (decimalSegment.selectedSegmentIndex < decimalSegment.numberOfSegments-1 ? "%.\(decimalSegment.selectedSegmentIndex+1)f" : "%f")
        let outputString = String(format: formatString, outputValue)
        resultsLabel.text = "\(inputValue) \(fromUnits) = \(outputString) \(toUnits)"
    }
    
    
    @IBAction func decimalSelected(_ sender: Any) {
        calculateConversion()
    }
    
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        calculateConversion()
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
        conversionString = formulaArray[row]
        let unitsArray = formulaArray[row].components(separatedBy: " to ")
        fromUnits = unitsArray[0]
        toUnits = unitsArray[1]
        fromUnitsLabel.text = fromUnits
        calculateConversion()
        
    }
}


