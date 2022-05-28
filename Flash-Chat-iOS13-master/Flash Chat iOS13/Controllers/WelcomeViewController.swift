//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = K.appName
//        titleLabel.text = ""
//        var cherIndex = 0.0
//        let titleText = "⚡️FlashChat"
//        for letter in titleText {
//            Timer.scheduledTimer(withTimeInterval: 0.1 * cherIndex, repeats: false) { timer in
//                self.titleLabel.text?.append(letter)
//            }
//            cherIndex += 1
//        }

        var arr: [Int] = []
        func fibonacci(n: Int) {
            for i in 0..<n {
                if i == 0 {
                    arr.append(0)
                } else if i == 1 {
                    arr.append(1)
                }else {
                    arr.append( arr[i - 2] + arr[i - 1] )
                }
            }
            print(arr)
        }
            
        fibonacci(n: 5)
            
    }
    

}
