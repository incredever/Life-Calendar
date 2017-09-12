import Cocoa

/// An NSTableRowView which displays an EventView in the sidebar table view.
class SidebarTableRowView: NSTableRowView {

    private var trackingArea: NSTrackingArea? = nil
    private var mouseIsHovering = false

    override func draw(_ dirtyRect: NSRect) {
        if mouseIsHovering {
            NSColor(calibratedRed: 0.7, green: 0.7, blue: 1.0, alpha: 1.0).set()
            let path = NSBezierPath(rect: dirtyRect)
            path.lineWidth = 5
            path.stroke()
        }
    }
    
    // Area tracking and responder stuff
    
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
