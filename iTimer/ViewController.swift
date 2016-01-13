//
//  ViewController.swift
//  iTimer
//
//  Created by Rahul Patle on 1/12/16.
//  Copyright © 2016 CODECOOP. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var laps: [String] = []
    
    var timer = NSTimer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    
    var stopwatchString: String = ""
    
    var startStopWatch: Bool = true
    var addLap: Bool = false
    
    @IBOutlet var lapResetBtn: UIButton!
    @IBOutlet var startStopBtn: UIButton!
    @IBOutlet var lapsTable: UITableView!
    @IBOutlet var stopWatchLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopWatchLbl.text = "00:00:00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func startStop(sender: AnyObject) {
        if startStopWatch == true {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateStopWatch"), userInfo: nil, repeats: true)
            startStopWatch = false
            
            startStopBtn.setImage(UIImage(named: "stop.png"), forState: UIControlState.Normal)
            lapResetBtn.setImage(UIImage(named:"lap.png"), forState: UIControlState.Normal)
            
            addLap = true
        } else {
            timer.invalidate()
            startStopWatch = true
            
            startStopBtn.setImage(UIImage(named:"start.png"), forState: .Normal)
            lapResetBtn.setImage(UIImage(named:"reset.png"), forState: .Normal)
            
            addLap = false
        }
    }
   
    @IBAction func lapReset(sender: AnyObject) {
        if addLap == true {
            laps.insert(stopwatchString, atIndex: 0)
            lapsTable.reloadData()
            
        } else {
            addLap == false
            lapResetBtn.setImage(UIImage(named: "lap.png"), forState: .Normal)
            
            laps.removeAll()
            lapsTable.reloadData()
            
            fractions = 0
            seconds = 0
            minutes = 0
            
            stopwatchString = "00:00:00"
            stopWatchLbl.text = stopwatchString
        
        }
    }
    
    func updateStopWatch() {
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopwatchString = "\(minutesString):\(secondsString).\(fractionsString)"
        stopWatchLbl.text = stopwatchString
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Lap \(laps.count-indexPath.row)"
        cell.detailTextLabel?.text = laps[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
}

