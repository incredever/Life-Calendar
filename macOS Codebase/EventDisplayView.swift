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
        
//        let label = NSLabel
        
//        setItemPropertiesToDefault(sender: self)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setItemPropertiesToDefault(sender: AnyObject) {
//        itemColor = NSColor.red
//        itemLocation = NSPoint(x: 0, y: 0)
//        backgroundColor = NSColor.white
//    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.blue.set()
        NSBezierPath.fill(dirtyRect)
    }
}
