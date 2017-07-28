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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var correctTapsLabel: UILabel!
    @IBOutlet weak var movingBlock: UIImageView!
    
    // implementation variables
    var correctTaps = 0
    let blockWidth = 50
    let blockHeight = 50
    var blockLocation = CGRect(x: 100, y: 100, width: 100, height: 100)
    var playTimer = Timer()
    var leftBound = 0
    var rightBound = 0
    var topBound = 0
    var lowerBound = 0
    let timeLimit = 20.0 //in secs
    var timeLeft = 0.0
    let timeRes = 0.5
    var nIterations = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        blockLocation = CGRect(x: 0, y: 250, width: blockWidth, height: blockHeight)
        movingBlock.frame = blockLocation
        timeLeft = timeLimit
        timeLabel.text = "TimeLeft: " + String(timeLeft)
        correctTapsLabel.text = String(correctTaps)
        
        // set screenbounds
        let screenSize = self.view.bounds
        leftBound = Int(screenSize.minX)
        rightBound = Int(screenSize.maxX)
        topBound = Int(screenSize.minY)
        lowerBound = Int(screenSize.maxY)
        
        
        scores.append(5)
        
        
    }
    
    @IBAction func screenTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: view)
        if movingBlock.frame.contains(point) {
            correctTaps += 1
            correctTapsLabel.text = "Hits: " + String(correctTaps)
            print("Button Hit!!")
        }
        else {
            print("Missed")
        }
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        playTimer = Timer.scheduledTimer(timeInterval: timeRes, target: self, selector: #selector(updateButtonLocation), userInfo: nil, repeats: true)
        startButton.isEnabled = true
        startButton.isOpaque = true
    }
    
    func updateButtonLocation() {
        
        // update timer label
        timeLabel.text = "TimeLeft: " + String(timeLeft)
        
        // update location of button
        let tmpX = arc4random_uniform(UInt32(rightBound - blockWidth))
        let tmpY = arc4random_uniform(UInt32(lowerBound - blockHeight))
        movingBlock.frame = CGRect(x: Int(tmpX), y: Int(tmpY), width: blockWidth, height: blockHeight)
        
        // make button visible or invisible 
        if nIterations % 2 == 0 {
            movingBlock.backgroundColor = self.view.backgroundColor
        }
        else {
            movingBlock.backgroundColor = UIColor.red
        }
        
        timeLeft -= timeRes
        nIterations += 1
        
        if timeLeft == 0.0 {
            playTimer.invalidate()
            timeLeft = timeLimit
            correctTaps = 0
            nIterations = 0
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
