//
//  WeeksViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/7/17.
//

import Cocoa
import SpriteKit

/// A VC that contains an NSView > SKView > SKScene hierarchy for displaying a human life in weeks. All this is setup inside the `loadView` and `viewDidLoad` methods.
class WeeksViewController: NSViewController {
    
    var skView: SKView!
    var skScene: WeeksScene?
    weak var window: NSWindow?
    var timeline: Timeline!
    
    override func loadView() {
        let windowSize = window?.frame.size ?? CGSize(width: 0, height: 0)
        
        view = NSView(frame: NSRect(x: 0, y: 0, width: windowSize.width, height: windowSize.height + 22))
        skView = SKView(frame: NSRect(x: 0, y: 0, width: windowSize.width, height: windowSize.height))
        
        view.addSubview(skView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up testing timeline
        let span = DateInterval(start: Date(), end: Date())
        let exampleEvent1 = Event(title: "Hello World", colorHex: "000000", span: span)
        let exampleEvent2 = Event(title: "Test Event", colorHex: "FFFFFF", span: span)
        let exampleEvent3 = Event(title: "Blah blah blah", colorHex: "FFFFFF", span: span)
        let timeline = Timeline(events: [exampleEvent1, exampleEvent2, exampleEvent3], name: "Testing timeline ABC 1234")
        
        timeline.saveToDisk()
        
        skScene = WeeksScene(size: skView.frame.size)
        skScene?.backgroundColor = NSColor(hexString: Color.sceneBackground.rawValue)
        skScene?.scaleMode = .aspectFill

        skView.presentScene(skScene)
        skView.showsNodeCount = true
        skView.showsFPS = true
        
        window?.acceptsMouseMovedEvents = true
        window?.makeFirstResponder(skScene)
        window?.setFrameAutosaveName(NSWindow.FrameAutosaveName(rawValue: "mainLifeCalendarWindow"))
        
        // Create Grid
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let myBirth = dateFormatter.date(from: "1993-01-05")!
        let possibleDeath = dateFormatter.date(from: "2083-01-04")!
        let size = CGSize(width: 330, height: 574)
        let gridPosition = CGPoint(x: 20, y: Int(size.height) - 10)
        
        let grid = WeeksGrid(start: myBirth, end: possibleDeath, position: gridPosition)
        
        grid.delegate = self
        grid.timeline = timeline
        
        skScene?.addChild(grid.node)
        
        // Create sidebar
        let sidebarSize = CGSize(width: 150, height: skView.frame.height)
        let sidebarPosition = CGPoint(x: skView.frame.width - sidebarSize.width, y: skView.frame.height)
        let sidebar = EventsDisplaySidebar(timeline: timeline, size: sidebarSize)
        sidebar.position = sidebarPosition
        
        skScene?.addChild(sidebar.node)
    }
    
}

extension WeeksViewController: GridBasedEventCreationDelegate {
    func eventCreated(spanning: DateInterval) {
        print("NEW EVENT CREATED EVERYBODY")
        
        // send this info to sidebar
    }
}
