//
//  ViewController.swift
//  BMI Calculator
//
//  Created by 김희진 on 2022/05/15.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recaculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
