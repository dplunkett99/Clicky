//
//  PlayScreenViewController.swift
//  Clicky
//
//  Created by Yamil Ivan Rodriguez on 7/27/17.
//  Copyright © 2017 DGS. All rights reserved.
//

import UIKit

class PlayScreenViewController: UIViewController {

    // outlet declaration
    @IBOutlet weak var clickyButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    // implementation variables
    var successfulPresses = 0
    let buttonWidth = 50
    let buttonHeight = 50
    var buttonLocation = CGRect(x: 100, y: 100, width: 100, height: 100)
    var playTimer = Timer()
    var leftBound = 0
    var rightBound = 0
    var topBound = 0
    var lowerBound = 0
    let timeLimit = 10 //in secs
    var timeLeft = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        buttonLocation = CGRect(x: 0, y: 250, width: buttonWidth, height: buttonHeight)
        clickyButton.frame = buttonLocation
        timeLeft = timeLimit
        timeLabel.text = "TimeLeft: " + String(timeLeft)
        
        // set screenbounds
        let screenSize = self.view.bounds
        leftBound = Int(screenSize.minX)
        rightBound = Int(screenSize.maxX)
        topBound = Int(screenSize.minY)
        lowerBound = Int(screenSize.maxY)
        
        
        scores.append(5)
        
        
    }
    
    
    @IBAction func clickyButton(_ sender: UIButton) {
        
        playTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateButtonLocation), userInfo: nil, repeats: true)
        
        // update timer label
        timeLabel.text = "TimeLeft: " + String(timeLeft)

    }
    
    func updateButtonLocation() {
        
        // update location of button
        let tmpX = arc4random_uniform(UInt32(rightBound - buttonWidth))
        let tmpY = arc4random_uniform(UInt32(lowerBound - buttonHeight))
        clickyButton.frame = CGRect(x: Int(tmpX), y: Int(tmpY), width: buttonWidth, height: buttonHeight)
        
        // make button visible or invisible 
        if timeLeft % 2 == 0 {
            clickyButton.backgroundColor = self.view.backgroundColor
            clickyButton.isEnabled = false
        }
        else {
            clickyButton.isEnabled = true
            clickyButton.backgroundColor = UIColor.red
        }
        
        timeLeft -= 1
        
        if timeLeft == 0 {
            playTimer.invalidate()
            timeLeft = timeLimit
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
