//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    
    @objc func updateCounter() {
        //example functionality
        if counter > 0 {
            print(counter)
            titleChange.text = "Preparing eggs"
            counter -= 1
        } else if counter == 0 {
            titleChange.text = "Done!"
        }
    }
    
    var timer = Timer()
    
    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    @IBOutlet weak var titleChange: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
        let hardness = sender.currentTitle!
        
        counter = eggTime[hardness]!
        
    }
    
}
