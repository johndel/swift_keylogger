//
//  ViewController.swift
//  test
//
//  Created by IOANNIS DELIGIANNIS on 1/2/16.
//  Copyright © 2016 IOANNIS DELIGIANNIS. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(120, target: self, selector: Selector("takeScreenshot"), userInfo: nil, repeats: true)
    }
    
    func takeScreenshot() {
        print("test")
            let task = NSTask()
            let date_timestamp2 = String(NSDate().timeIntervalSince1970)
            task.launchPath = "/usr/sbin/screencapture"
            task.arguments = ["-x", "/Users/johndel/projects/swift/test/screen" + date_timestamp2 + ".png"]
            task.launch()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

