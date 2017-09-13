import Cocoa

class EventView: NSView {

    private var event = Event(title: "Default Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
    
    convenience init(event: Event) {
        self.init(frame: NSRect.zero)
        
        self.event = event
        
        // TODO: Update the title textfield and other stuff to display values from event.
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // test adding a textfield-based title
        let titleTextField = NSTextField(string: "\(event.title)")
        addSubview(titleTextField)
        
        let layoutConstraint = NSLayoutConstraint(item: titleTextField,
                                                  attribute: .top,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        layoutConstraint.isActive = true
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.lightGray.set()
        let topLine = NSBezierPath(rect: NSRect(x: 0, y: dirtyRect.height - 0.5, width: dirtyRect.size.width, height: 0.5))
        topLine.fill()
    }
    
}
