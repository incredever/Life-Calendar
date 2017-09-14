import Cocoa

protocol EventDetailsChangeDelegate {
    func titleChange(to: String, textField: NSTextField)
}

class EventView: NSView {

    private var event = Event(title: "New Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
    let titleTextField = NSTextField(string: "Event Title")
    var eventChangeDelegate: EventDetailsChangeDelegate? = nil
    
    convenience init(event: Event) {
        self.init(frame: NSRect.zero)
        
        self.event = event
        
        titleTextField.stringValue = event.title
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        if #available(OSX 10.12.2, *) { titleTextField.allowsCharacterPickerTouchBarItem = true }
        titleTextField.isBezeled = false
        titleTextField.isBordered = false
        titleTextField.drawsBackground = false
        titleTextField.target = self
        titleTextField.action = #selector(titleChange)
        
        addSubview(titleTextField)
        
        let layoutConstraint = NSLayoutConstraint(item: titleTextField,
                                                  attribute: .top,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: self,
                                                  attribute: .top,
                                                  multiplier: 1.0,
                                                  constant: 0.0)
        layoutConstraint.isActive = true
        
        titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    @objc func titleChange() {
        eventChangeDelegate?.titleChange(to: titleTextField.stringValue, textField: titleTextField)
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        NSColor.lightGray.set()
        let topLine = NSBezierPath(rect: NSRect(x: 0, y: dirtyRect.height - 0.5, width: dirtyRect.size.width, height: 0.5))
        topLine.fill()
    }
    
}
