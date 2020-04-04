import SwiftUI

struct Event: Identifiable {
    
    let id: UUID
    let start: Date
    let end: Date
    let color: Color
    let title: String
    
    func isDuring(_ week: Week) -> Bool {
        let startsDuring = start > week.start && start < week.end
        let endsDuring = end > week.start && end < week.end
        
        return (startsDuring || endsDuring)
    }
    
}
