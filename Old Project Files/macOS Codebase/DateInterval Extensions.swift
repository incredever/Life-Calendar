import Foundation

extension DateInterval {
    
    /// Provides a `DateInterval` spanning exactly seven days from `start`.
    static func oneWeek(startingFom start: Date) -> DateInterval {
        return DateInterval(start: start, duration: 604800)
    }
    
    /// Returns the number of years between the `start` and `end` dates of this `DateInterval`.
    func numberOfYearsWithin() -> Int {
        let calendar = Calendar.current
        
        let components = calendar.dateComponents([.year], from: start, to: end)
        
        if let numberOfYears = components.year {
            return numberOfYears
        } else {
            return 0
        }
    }
    
}
