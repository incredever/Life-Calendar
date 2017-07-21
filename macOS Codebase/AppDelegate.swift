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
        let timeline = Timeline(name: "Testing")
        
        timeline.saveToDesktop()
    }
    
}
