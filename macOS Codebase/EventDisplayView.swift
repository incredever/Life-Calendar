//
//  EventDisplayView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/29/17.
//

import Cocoa

class EventDisplayView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.green.set()
        
        let rect = NSRect(origin: CGPoint.zero, size: dirtyRect.size)
        NSBezierPath(roundedRect: rect, xRadius: 10.0, yRadius: 10.0).fill()
    }
    
}
