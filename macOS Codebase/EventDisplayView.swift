//
//  EventDisplayView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/29/17.
//

import Cocoa

class EventDisplayView: NSTableCellView {

    private var event: Event
    private var title: NSTextField
    
    convenience init(event: Event) {
        self.init(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
        
        self.event = event
        title.stringValue = event.title
        
        // Create edit button
        let editButton = NSButton(image: NSImage.init(named: NSImage.Name("Edit Pencil"))!, target: self, action: #selector(self.editButtonPressed))
        addSubview(editButton)
    }
    
    @objc func editButtonPressed(_ sender: NSButton) {
        print("edit button pressed")
    }
    
    override init(frame frameRect: NSRect) {
        event = Event(title: "Default Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
        
        title = NSTextField(wrappingLabelWithString: event.title)
        
        super.init(frame: frameRect)

        self.addSubview(title)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.lightGray.set()
        let topLine = NSBezierPath(rect: NSRect(x: 0, y: dirtyRect.height - 0.5, width: dirtyRect.size.width, height: 0.5))
        topLine.fill()
        
        let topLeftPoint = CGPoint(x: 5, y: dirtyRect.height)
        let titlePosition = CGPoint(x: topLeftPoint.x, y: topLeftPoint.y - 23)
        let title = NSString(string: event.title)
        title.draw(at: titlePosition, withAttributes: nil)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        
        let startDate = formatter.string(from: event.span.start)
        let endDate = formatter.string(from: event.span.end)
        
        let dates = NSString(string: "\(startDate) - \(endDate)")
        dates.draw(at: NSPoint(x: 5, y: 20), withAttributes: nil)
        
        if mouseIsHovering {
            NSColor.red.set()
            NSBezierPath(rect: NSRect(x: 10, y: 10, width: 10, height: 10)).fill()
        }
    }
    
    private var mouseIsHovering = false
    private var trackingArea: NSTrackingArea? = nil
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
       
        if trackingArea == nil {
            trackingArea = NSTrackingArea(rect: NSRect.zero, options: [.inVisibleRect, .activeAlways, .mouseEnteredAndExited], owner: self, userInfo: nil)
        }
        
        if !trackingAreas.contains(trackingArea!) {
            self.addTrackingArea(trackingArea!)
        }
    }
    
    override func mouseDown(with event: NSEvent) {

    }
    
    override func mouseEntered(with event: NSEvent) {
        mouseIsHovering = true
        needsDisplay = true
    }
    
    override func mouseExited(with event: NSEvent) {
        mouseIsHovering = false
        needsDisplay = true
    }
}
