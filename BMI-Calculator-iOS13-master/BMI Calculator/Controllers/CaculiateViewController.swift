//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CaculiateViewController: UIViewController {

    @IBOutlet var heightLable: UILabel!
    @IBOutlet var weightLabel: UILabel!
    
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!
    
    var caculaterBrain = CaculaterBrain()
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLable.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
//        weightLabel.text = "\(Int(sender.value))"
        weightLabel.text = "\(String(format: "%.0f", sender.value))Kg"
    }
    
    
    @IBAction func caculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value

        caculaterBrain.cacuateBMI(height: height, weight: weight)
        
//        let vc = SecondViewController()
//        vc.bmiValue = String(format: "%.1f", bmi)
//        self.present(vc, animated: true, completion: nil)
        self.performSegue(withIdentifier: "gotoResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = caculaterBrain.getBMIValue()
            destinationVC.advice = caculaterBrain.getAdvice()
            destinationVC.color = caculaterBrain.getColo()
        }
    }
    
}

