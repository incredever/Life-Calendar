//
//  DraggableItemView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/29/17.
//

import Cocoa

class DraggableItemView: NSView {
    
    var itemColor: NSColor!
    var location: NSPoint!
    var backgroundColor: NSColor!
    
    override init(frame: NSRect) {
        super.init(frame: frame)
        
        setItemPropertiesToDefault(sender: self)
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setItemPropertiesToDefault(sender: AnyObject) {
        itemColor = NSColor.red
        location = NSPoint(x: 0, y: 0)
        backgroundColor = NSColor.white
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.white.set()
        NSBezierPath.fill(dirtyRect)
        itemColor.set()
    }
    
}
