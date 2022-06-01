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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            let calcutator = CalculatorLogic(number: displayValue)
            
            guard let result = calcutator.calc(symbol: calcMethod) else {
                fatalError("nil")
            }
            displayValue = result
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

