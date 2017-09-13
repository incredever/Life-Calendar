import Cocoa

/// An NSTableRowView which displays an EventView in the sidebar table view.
class EventsTableRowView: NSTableRowView {

    private var trackingArea: NSTrackingArea? = nil
    private var mouseIsHovering = false

    override func drawSelection(in dirtyRect: NSRect) {
        NSColor(hexString: Color.selectionBorder.rawValue).set()
        let path = NSBezierPath(rect: dirtyRect)
        path.lineWidth = 4
        path.stroke()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        if mouseIsHovering && !isSelected {
            NSColor(hexString: Color.hoverBorder.rawValue).set()
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
