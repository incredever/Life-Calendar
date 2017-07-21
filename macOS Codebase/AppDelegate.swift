//
//  AppDelegate.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 5/30/17.
//
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let exampleEvent = Event(title: "ABC", colorHex: "000000", starting: Date(), ending: Date())
        let timeline = Timeline(events: [exampleEvent], name: "Testing ABC")
        
        timeline.saveToDisk()
    }
    
}
