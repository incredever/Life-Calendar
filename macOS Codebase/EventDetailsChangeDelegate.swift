import Cocoa

protocol EventDetailsChangeDelegate {
    func titleChange(to: String, textField: NSTextField)
}
