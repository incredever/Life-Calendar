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
    weak var window: NSWindow?
    var timeline: Timeline!
    var tableView: NSTableView!
    
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
        
        timeline = Timeline(events: [exampleEvent1, exampleEvent2, exampleEvent3], name: "Testing timeline ABC 1234")
        
        timeline.saveToDisk()
        
        let scene = SKScene(size: skView.frame.size)
        scene.backgroundColor = NSColor(hexString: Color.sceneBackground.rawValue)
        scene.scaleMode = .aspectFill

        skView.presentScene(scene)
        skView.showsNodeCount = true
        skView.showsFPS = true
        
        window?.acceptsMouseMovedEvents = true
        window?.makeFirstResponder(scene)
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
        
        scene.addChild(grid.node)
        
        // Create the table view
        let widthOfSidebar = CGFloat(150)
        let tableContainer = NSScrollView(frame: NSRect(x: view.frame.width - widthOfSidebar,
                                                        y: 0,
                                                        width: widthOfSidebar,
                                                        height: view.frame.height))
        
        tableView = NSTableView(frame: NSRect(origin: CGPoint(x: 0, y: 0),
                                              size: tableContainer.frame.size))

        let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(rawValue: "Column1"))
        column1.width = widthOfSidebar
        
        tableView.addTableColumn(column1)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        tableView.backgroundColor = NSColor(hexString: "F3F1F0")
        tableView.headerView = nil
        
        tableContainer.documentView = tableView
        tableContainer.hasVerticalScroller = true
        
        view.addSubview(tableContainer)
        
        /////////////
        
        let rect = NSRect(x: view.frame.width - widthOfSidebar,
                          y: 0,
                          width: widthOfSidebar,
                          height: view.frame.height)
        let area = NSTrackingArea(rect: rect, options: [.activeInKeyWindow, .mouseEnteredAndExited], owner: self, userInfo: nil)
        view.addTrackingArea(area)
    }
    
    override func mouseEntered(with event: NSEvent) {
        print("Mouse entered sidebar")
    }
    
    override func mouseExited(with event: NSEvent) {
        print("Mouse exited sidebar")
    }
    
}

extension WeeksViewController: GridBasedEventCreationDelegate {
    
    func eventCreated(spanning: DateInterval) {
        let newEvent = Event(title: "testing 123", colorHex: "FFFFFF", span: spanning)
        
        timeline.events.append(newEvent)
        
        tableView.reloadData()
    }
    
}

extension WeeksViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return timeline.events.count
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return nil
    }
    
}

extension WeeksViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let event = timeline.events[row]
        let eventDisplayView = EventDisplayView(event: event)
        
        return eventDisplayView
    }
    
}
