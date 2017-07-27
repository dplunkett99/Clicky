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
    var buttonLocation = CGRect(x: 100, y: 100, width: 100, height: 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        clickyButton.frame = buttonLocation
    }
    
    
    @IBAction func clickyButton(_ sender: UIButton) {
        
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
