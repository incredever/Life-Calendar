import Cocoa

protocol EventDetailsChangeDelegate {
    
    func titleChange(to: String, textField: NSTextField)
    func change(startDate: Date, forEventId: UUID)
    
}
