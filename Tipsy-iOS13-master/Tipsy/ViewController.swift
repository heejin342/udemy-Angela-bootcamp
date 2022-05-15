//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var biillTextField: UITextField!
 
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var tenButton: UIButton!
    @IBOutlet var twentyButton: UIButton!
    @IBOutlet var numberLabel: UILabel!

    
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var result = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        
        biillTextField.endEditing(true)
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        numberLabel.text = "\(Int(sender.value))"
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func caculatePressed(_ sender: Any) {
        
        if let safeTF = biillTextField.text {
            billTotal = Double(safeTF)!

            result = billTotal * (1 + tip) / Double(numberOfPeople)
            self.performSegue(withIdentifier: "gotoResult", sender: self)
        }
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = String(format: "%.2f", result)
        }
    }
}

