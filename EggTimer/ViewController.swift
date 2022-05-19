//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            titleChange.text = "Done!"
        }
    }
    
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    @IBOutlet weak var titleChange: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        titleChange.text = "Preparing \(hardness.lowercased()) eggs..."
        progressBar.progress = 0.0
        secondsPassed = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
}
