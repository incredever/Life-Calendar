import Cocoa

protocol EventDetailsChangeDelegate {
    
    func change(title: String, forEventId: UUID)
    func change(startDate: Date, forEventId: UUID)
    
}
