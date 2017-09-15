import Cocoa

class EventView: NSView {

    private var event = Event(title: "New Event", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
    let titleTextField = NSTextField(string: "Event Title")
    let startDatePicker = NSDatePicker()
    var eventChangeDelegate: EventDetailsChangeDelegate? = nil
    
    convenience init(event: Event) {
        self.init(frame: NSRect.zero)
        
        self.event = event
        
        titleTextField.stringValue = event.title
        startDatePicker.dateValue = event.span.start
    }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        // Title text field
        if #available(OSX 10.12.2, *) { titleTextField.allowsCharacterPickerTouchBarItem = true }
        titleTextField.isBezeled = false
        titleTextField.isBordered = false
        titleTextField.drawsBackground = false
        titleTextField.target = self
        titleTextField.action = #selector(titleChange)
        addSubview(titleTextField)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleTextField.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        titleTextField.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        // Start date picker
        addSubview(startDatePicker)
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
        startDatePicker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        startDatePicker.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        startDatePicker.trailingAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startDatePicker.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
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
