//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!

    // private < fileprivate < internal(default) < pu   blic < open
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let currentDisplayVal = Double(displayLabel.text!) else {
                fatalError("fatal error")
            }
            return currentDisplayVal
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    private var calcutator = CalculatorLogic()

    @IBAction func calcButtonPressed(_ sender: UIButton) {

        isFinishedTypingNumber = true
        
        calcutator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calcutator.calc(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {

        if let numVal = sender.currentTitle {

            if isFinishedTypingNumber {
                displayLabel.text = numVal
                isFinishedTypingNumber = false
            }else {
                if numVal == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                    
                }
                displayLabel.text = displayLabel.text! + numVal
            }
        }

    }

}

