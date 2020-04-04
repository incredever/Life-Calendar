import SwiftUI

struct Event: Identifiable, TimeSpan {
    
    let id: UUID
    let start: Date
    let end: Date
    let color: Color
    let title: String
        
}
