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
    let buttonWidth = 100
    let buttonHeight = 100
    var buttonLocation = CGRect(x: 100, y: 100, width: 100, height: 100)
    var playTimer = Timer()
    var leftBound = 0.0
    var rightBound = 0.0
    var topBound = 0.0
    var lowerBound = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        clickyButton.frame = buttonLocation
        
        // set screenbounds
        let screenSize = self.view.bounds
        leftBound = Double(screenSize.minX)
        rightBound = Double(screenSize.maxX)
        topBound = Double(screenSize.minY)
        lowerBound = Double(screenSize.maxY)
        
        
    }
    
    
    @IBAction func clickyButton(_ sender: UIButton) {
        
        playTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateButtonLocation), userInfo: nil, repeats: true)
        
    }
    
    func updateButtonLocation() {
        
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
