//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressbar: UIProgressView!

    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thiredButton: UIButton!
  
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnser = sender.currentTitle!
 
        if quizBrain.checkAnswer(userAnser) {
            sender.backgroundColor = .green
        }else{
            sender.backgroundColor = .red
        }
       
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressbar.progress = quizBrain.getProgress()

        firstButton.setTitle(quizBrain.getButtonText(of: 0), for: .normal)
        secondButton.setTitle(quizBrain.getButtonText(of: 1), for: .normal)
        thiredButton.setTitle(quizBrain.getButtonText(of: 2), for: .normal)
 
        firstButton.backgroundColor = .clear
        secondButton.backgroundColor = .clear
        thiredButton.backgroundColor = .clear
    }

}

