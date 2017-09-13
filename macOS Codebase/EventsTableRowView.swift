import Cocoa

/// An NSTableRowView which displays an EventView in the sidebar table view.
class EventsTableRowView: NSTableRowView {

    private var trackingArea: NSTrackingArea? = nil
    private var mouseIsHovering = false

    override func drawSelection(in dirtyRect: NSRect) {
        NSColor(calibratedRed: 0.3, green: 0.3, blue: 0.9, alpha: 0.8).set()
        NSBezierPath(rect: dirtyRect).fill()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        if mouseIsHovering {
            
//            drawFocusRingMask()
            
            NSColor(calibratedRed: 0.4, green: 0.4, blue: 1.0, alpha: 1.0).set()
            let path = NSBezierPath(rect: dirtyRect)
            path.lineWidth = 5
            path.stroke()
        }
    }
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        
        if trackingArea == nil {
            trackingArea = NSTrackingArea(rect: NSRect.zero, options: [.inVisibleRect, .activeAlways, .mouseEnteredAndExited], owner: self, userInfo: nil)
        }
        
        if !trackingAreas.contains(trackingArea!) {
            self.addTrackingArea(trackingArea!)
        }
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
