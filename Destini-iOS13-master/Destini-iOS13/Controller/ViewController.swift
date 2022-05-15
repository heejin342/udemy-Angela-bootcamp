//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        changeUI()
    }

    @IBAction func selectBtn(_ sender: UIButton) {
  
        let userSelect = sender.currentTitle!

        storyBrain.moveToNextQuestion(userSelect)

        changeUI()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func changeUI(){
        storyLabel.text = storyBrain.getLabelText()
        choice1Button.setTitle(storyBrain.getButtonText(at: 0), for: .normal)
        choice2Button.setTitle(storyBrain.getButtonText(at: 1), for: .normal)

        choice1Button.backgroundColor = .clear
        choice2Button.backgroundColor = .clear
    }
    
    
}

