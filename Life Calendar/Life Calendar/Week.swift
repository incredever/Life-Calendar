import SwiftUI

struct Week: Identifiable {
    
    let id: String = UUID().uuidString
    let start: Date
    var end: Date {
        return start.advanced(by: 604800) // one week from start
    }
    let defaultColor: Color = .gray
    
    func isDuring(_ event: Event) -> Bool {
        let startsDuring = start > event.start && start < event.end
        let endsDuring = end > event.start && end < event.end
        
        return (startsDuring || endsDuring)
    }
    
}
