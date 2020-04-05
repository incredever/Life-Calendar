import SwiftUI

struct Week: Identifiable, TimeSpan {
    
    let id: String = UUID().uuidString
    let start: Date
    var end: Date {
        return start.advanced(by: 604800) // one week from start
    }
    let defaultColor: Color = .gray
        
}
