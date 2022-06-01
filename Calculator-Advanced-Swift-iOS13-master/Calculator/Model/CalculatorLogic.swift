//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 김희진 on 2022/05/30.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double){
        self.number = number
    }
    
    func calc(symbol: String) ->  Double? {

        if symbol == "+/-" {
            return number * -1
        }else if symbol == "AC" {
            return 0
        }else if symbol == "%" { //퍼센티지로 바꿔줌
            return number * 0.01
        }
        
        return nil
    }
}
