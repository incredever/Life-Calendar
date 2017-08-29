//
//  DraggableItemView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/29/17.
//
// https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CocoaViewsGuide/SubclassingNSView/SubclassingNSView.html
//

import Cocoa

class DraggableItemView: NSView {
    
    var itemColor: NSColor!
    var location: NSPoint!
    var backgroundColor: NSColor!
    
    /// Indicates when a drag is in progress.
    var dragging = false
    var lastDragLocation: NSPoint? = nil
    
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
    
    func isPointInItem(_ testPoint: NSPoint) -> Bool {
        var itemHit = false
        
        // Test first if we're in the rough bounds
        itemHit = NSPointInRect(testPoint, itemRect())
        
        // yes, let's further refine the testing
        if itemHit {
            // if this was a non-rectangular shape, you would refine the hit testing here
        }
        
        return itemHit
    }
    
    override func mouseDown(with event: NSEvent) {
        print("\nMouse down:")
        
        let clickLocation = convert(event.locationInWindow, from: nil)
        let itemHit = isPointInItem(clickLocation)
        
        print("event.locationInWindow: \(event.locationInWindow)")
        print("clickLocation: \(clickLocation)")
        
        if itemHit {
            print("item was hit")
            
            // Flag the instance variable that indicates a drag was actually started
            dragging = true
            
            // Store the starting mouse down loction
            lastDragLocation = clickLocation
            
            // Set the cursor to the closed hand cursor for the duration of the drag
            NSCursor.closedHand.push()
        }
    }
    
    private func offsetLocationBy(x: CGFloat, y: CGFloat) {
        // TODO: Implement this method
    }
    
    override func mouseDragged(with event: NSEvent) {
        print("\n Mouse dragged:")
        
        if dragging {
            print("Dragging item in progress")
            
            let newDragLocation = convert(event.locationInWindow, from: nil)
            
            // Offset the item by the change in mouse movement in the event
            offsetLocationBy(x: newDragLocation.x - lastDragLocation!.x,
                             y: newDragLocation.y - lastDragLocation!.y)
            
            // Question about above - why would you just set the location of the item directly, instead of doing things by offsets? Perhaps this will be answered when I take a look at Listing 4-10
            
            // Save the new drag location for the next drag event
            lastDragLocation = newDragLocation
            
            // Support automatic scrolling during a drag by calling NSView's autoscroll method
            autoscroll(with: event)
        }
    }
    
}
