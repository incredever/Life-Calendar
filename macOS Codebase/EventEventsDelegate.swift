import Cocoa

protocol EventEventsDelegate {
    
    func change(title: String, forEventId: UUID)
    func change(startDate: Date, forEventId: UUID)
    
}
