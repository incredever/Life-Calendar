//
//  AppDelegate.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 5/30/17.
//
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    var controller: ViewController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        let windowSize = NSRect(x: 10, y: 10, width: 600, height: 600)
        let windowStyle: NSWindow.StyleMask = [.titled, .resizable , .closable, .miniaturizable]
        window = NSWindow(contentRect: windowSize, styleMask: windowStyle, backing: .buffered, defer: false)
        
        controller = ViewController()
        let content = window.contentView! as NSView
        let view = controller!.view
        content.addSubview(view)
        
        window.makeKeyAndOrderFront(nil)
        
//        let exampleEvent = Event(title: "ABC", colorHex: "000000", starting: Date(), ending: Date())
//        let timeline = Timeline(events: [exampleEvent], name: "Testing ABC 1234")
//
//        timeline.saveToDisk()
    }
    
}
