import Foundation

struct Life {
    
    /// The average number of weeks in a human life, plus a little extra.
    private let maxWeeks = 4500
    
    /// All the weeks which this "Life" is likely to live.
    private(set) var weeks: [Week]
        
    var events: [Event]
    
    /// <#Description#>
    /// - Parameters:
    ///   - start: <#start description#>
    ///   - end: <#end description#>
    /// - Returns: Array of all the `Event`s within the provided time span. Empty if none found.
    func events(for week: Week) -> [Event] {
        return events.filter { $0.isDuring(week) }
    }
    
    init() {
        events = []
        
        weeks = []
        var previousWeek = Week(start: Date())
        for _ in 0..<maxWeeks {
            weeks.append(previousWeek)
            let newWeek = Week(start: previousWeek.end)
            previousWeek = newWeek
        }
    }
    
}
