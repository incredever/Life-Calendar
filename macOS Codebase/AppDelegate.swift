//
//  AppDelegate.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 5/30/17.
//
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var newWindow: NSWindow?
    var controller: ViewController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let windowSize = NSRect(x: 0, y: 0, width: 600, height: 600)
        newWindow = NSWindow(contentRect: windowSize, styleMask: .closable, backing: .buffered, defer: false)
        
        controller = ViewController()
        let content = newWindow!.contentView! as NSView
        let view = controller!.view
        content.addSubview(view)
        
        
        
        newWindow!.makeKeyAndOrderFront(nil)
        
        let exampleEvent = Event(title: "ABC", colorHex: "000000", starting: Date(), ending: Date())
        let timeline = Timeline(events: [exampleEvent], name: "Testing ABC 1234")

        timeline.saveToDisk()
    }
    
}
