//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var diceImageView1: UIImageView!
    @IBOutlet var diceImageView2: UIImageView!
    
    let images = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
    lazy var shuffled = images.shuffled()
    var leftNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        leftNum = Int.random(in: 0...5)

        /* MARK: 유데미 강의 알고리즘 테스트 코드
        let numbers: [Int] = [45, 73, 195, 53]
        var computedNumbers: [Int] = []
          
        for (index, i) in numbers.enumerated() {
            if index == numbers.count - 1 {
                computedNumbers.append( i * numbers[0])
            } else {
                computedNumbers.append( i * numbers[index + 1])
            }
        }
         print(computedNumbers)
        */

        /* MARK: 유데미 강의 알고리즘 테스트 코드
         let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
         var password = ""
         for _ in 0...5 {
             password += alphabet.randomElement()! as String
         }
         print( password )
         */
    }
    
    @IBAction func shuffleButton(_ sender: UIButton) {
        leftNum = Int.random(in: 0...5)
        diceImageView1.image = shuffled[leftNum]
        diceImageView2.image = shuffled.randomElement() as? UIImage
    }
    

}

