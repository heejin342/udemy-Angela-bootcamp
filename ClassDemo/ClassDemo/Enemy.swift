//
//  Enemy.swift
//  ClassDemo
//
//  Created by 김희진 on 2022/05/15.
//

import Foundation

struct Enemy {
    var health: Int
    var attackStrength: Ints
    
    init(health: Int, attackStregth: Int) {
        self.health = health
        self.attackStrength = attackStregth
    }

    mutating func takeDemage(amount: Int) {
        health = health - amount
    }

    func move() {
        print("Walk forwards.")
    }
    
    func attack(){
        print(attackStrength)
    }
}
    
