//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let softT = 5
    let mediumT = 7
    let hardT = 12
 
    let eggTimes = ["Soft": 5, "Medium":7, "Hard":12]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBAction func selectHardness(_ sender: UIButton) {
       
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        switch hardness {
        case "Soft":
            print(softT)
        case "Medium":
            print(mediumT)
        case "Hard":
            print(hardT)
        default:
            print("error")
        }
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {

            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)

        } else{
            timer.invalidate()
            titleLabel.text = "END"
                        
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
