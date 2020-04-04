import SwiftUI

struct Event: Identifiable {
    
    let id: UUID
    let start: Date
    let end: Date
    let color: Color
    let title: String
    
    func isDuring(_ week: Week) -> Bool {
        #warning("TODO")
        return false
    }
    
}
