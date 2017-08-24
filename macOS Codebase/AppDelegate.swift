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
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupWindow()
        
        // Testing creating and saving main data model to disk.
        let span = DateInterval(start: Date(), end: Date())
        let exampleEvent = Event(title: "ABC", colorHex: "000000", span: span)
        let timeline = Timeline(events: [exampleEvent], name: "Testing ABC 1234")
        timeline.saveToDisk()
        
        let dateFormatter = TimelineDateFormatter()
        
        let myBirth = dateFormatter.date(from: "1993-01-05")!
        let possibleDeath = dateFormatter.date(from: "2073-01-04")!
        let dateInterval = DateInterval(start: myBirth, end: possibleDeath)
        
        print("dateInterval.numberOfYearsWithin() => \(dateInterval.numberOfYearsWithin())")
    }
    
    func setupWindow() {
        // Create the window
        let windowSize = NSRect(x: 0, y: 0, width: 600, height: 600)
        let windowStyle: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .fullSizeContentView]
        
        window = NSWindow(contentRect: windowSize, styleMask: windowStyle, backing: .buffered, defer: false)
        
        window.makeKeyAndOrderFront(nil)

        // Style the window
        window.titlebarAppearsTransparent = true
        window.isMovableByWindowBackground = true
        window.titleVisibility = .visible
        window.title = "Life Calendar"
        window.backgroundColor = NSColor(hexString: Color.sceneBackground.rawValue)
        window.center()
        
        // Set the VC
        let weeksViewController = WeeksViewController()
        
        weeksViewController.window = window
        
        window.contentViewController = weeksViewController
    }
    
}
