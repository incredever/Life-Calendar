import Foundation

struct Life {
    
    var events: [Event]
    
    /// <#Description#>
    /// - Parameters:
    ///   - start: <#start description#>
    ///   - end: <#end description#>
    /// - Returns: Array of all the `Event`s within the provided time span. Empty if none found.
    func events(for week: Week) -> [Event] {
        return events.map { $0.isDuring(week) }
    }
    
}
