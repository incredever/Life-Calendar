//
//  EventDisplayView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/29/17.
//

import Cocoa

class EventDisplayView: NSView {

    private var event: Event
    
    convenience init(event: Event, frame: NSRect) {
        self.init(frame: frame)
        
        print(event)
        
        self.event = event
    }
    
    override init(frame frameRect: NSRect) {
        event = Event(title: "Default Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
        
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.green.set()
        
        let rect = NSRect(origin: CGPoint.zero, size: dirtyRect.size)
        NSBezierPath(roundedRect: rect, xRadius: 10.0, yRadius: 10.0).fill()
        
        let titleString = NSString(string: event.title)
        titleString.draw(at: NSPoint.zero, withAttributes: nil)
    }
    
}
