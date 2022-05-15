//
//  CaculaterBrain.swift
//  BMI Calculator
//
//  Created by 김희진 on 2022/05/15.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CaculaterBrain {
    
    var bmi: BMI?

    mutating func cacuateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18.5 {
            print("under weight")
            bmi = BMI(value: bmiValue, adivice: "Eat more", color: .blue)
        } else if bmiValue < 24.9 {
            print("normal weight")
            bmi = BMI(value: bmiValue, adivice: "Fit as a fiddle", color: .green)
        } else {
            print("overweight")
            bmi = BMI(value: bmiValue, adivice: "Eat less pies", color: .red)
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)

//        if let safeBMI = bmi {
//            return String(format: "%.1f", safeBMI)
//        }else {
//            return "0.0"
//        }
    }
    
    func getAdvice() -> String {
        return bmi?.adivice ?? "No advice"
    }

    func getColo() -> UIColor {
        return bmi?.color ?? .blue
    }

}
