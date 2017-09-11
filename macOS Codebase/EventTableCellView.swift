import Cocoa

class EventTableCellView: NSTableCellView {

    private var event: Event
    private var mouseIsHovering = false
    private var isSelected = false
    private var trackingArea: NSTrackingArea? = nil
    
    convenience init(event: Event) {
        self.init(frame: NSRect.zero)
        
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
        
        if isSelected {
            NSColor(calibratedRed: 0.3, green: 0.3, blue: 1.0, alpha: 1.0).set()
            let path = NSBezierPath(rect: dirtyRect)
            path.lineWidth = 5
            path.stroke()
        } else if mouseIsHovering {
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

    override func mouseDown(with event: NSEvent) {
        print("row clicked")
        isSelected = true
        needsDisplay = true
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
