//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 김희진 on 2022/05/30.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?

//    init(number: Double){
//        self.number = number
//    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calc(symbol: String) ->  Double? {

        if let n = number {
            if symbol == "+/-" {
                return n * -1
            }else if symbol == "AC" {
                return 0
            }else if symbol == "%" { //퍼센티지로 바꿔줌
                return n * 0.01
            }else if symbol == "=" {
                return performTwoNumberCalc(n2: n)
            }else { // +, - , *, %
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumberCalc(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("operation passed in not matched")
            }
        }
        return nil
    }
}

