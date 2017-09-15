import Cocoa

/// Called by things which create or change an event.
protocol EventEventsDelegate {
    
    func change(title: String, forEventId: UUID)
    func change(startDate: Date, forEventId: UUID)
    func new(event: Event)

}
