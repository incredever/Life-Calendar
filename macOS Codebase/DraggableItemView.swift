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
    
    override var isOpaque: Bool { return true }
    
    override var acceptsFirstResponder: Bool { return true }
    
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
    
    private func itemRect() -> NSRect {
        return NSRect(origin: location, size: CGSize(width: 60, height: 20))
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.white.set()
        NSBezierPath.fill(dirtyRect)
        itemColor.set()
        NSBezierPath.fill(itemRect())
    }
    
    override func mouseDown(with event: NSEvent) {
        print("mouse down")
    }
    
}
