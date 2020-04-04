import Foundation

struct Life {
    
    /// All the weeks which this "Life" is likely to live.
    let weeks: [Week] = {
        var weeks: [Week] = []
        var previousWeek = Week(start: Date())
        for i in 0...4500 {
            weeks.append(previousWeek)
            let newWeek = Week(start: previousWeek.end)
            previousWeek = newWeek
        }
        return weeks
    }()
    
    var events: [Event]
    
    /// <#Description#>
    /// - Parameters:
    ///   - start: <#start description#>
    ///   - end: <#end description#>
    /// - Returns: Array of all the `Event`s within the provided time span. Empty if none found.
    func events(for week: Week) -> [Event] {
        return events.filter { $0.isDuring(week) }
    }
    
}
