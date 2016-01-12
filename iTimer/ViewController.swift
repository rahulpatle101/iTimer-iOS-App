//
//  ViewController.swift
//  iTimer
//
//  Created by Rahul Patle on 1/12/16.
//  Copyright © 2016 CODECOOP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var lapResetBtn: UIButton!
    @IBOutlet var startStopBtn: UIButton!
    @IBOutlet var lapsTable: UITableView!
    @IBOutlet var stopWatchLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startStop(sender: AnyObject) {
    }
   
    @IBAction func lapReset(sender: AnyObject) {
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Lap"
        cell.detailTextLabel?.text = "00:00:00"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

