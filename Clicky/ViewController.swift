//
//  ViewController.swift
//  Clicky
//
//  Created by CTETCHR1 on 7/27/17.
//  Copyright © 2017 DGS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //outlet variables
    @IBOutlet weak var tableView: UITableView!
    
    var scores:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scores.append(1)
        scores.append(4)
    
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(scores[indexPath.row])
        return cell
    }



}

