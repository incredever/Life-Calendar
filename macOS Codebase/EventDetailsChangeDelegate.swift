import Cocoa

protocol EventDetailsChangeDelegate {
    
    func titleChange(to: String, textField: NSTextField)
    func startDateChange(to: Date, datePicker: NSDatePicker)
    
}
