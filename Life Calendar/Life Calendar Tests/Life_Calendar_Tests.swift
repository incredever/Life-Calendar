import XCTest
@testable import Life_Calendar

class Life_Calendar_Tests: XCTestCase {
    
    /// Tests the `.isDuring(_:)` methods of both `Event` and `Week`.
    func testIsDuring() {
        
        // Set up various dates for testing
        let calendar = Calendar.current
        let fourteenDaysAgo = calendar.date(byAdding: .day, value: -14, to: Date())!
        let today = calendar.date(byAdding: .day, value: 0, to: Date())!
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        let oneYearAgoToday = calendar.date(byAdding: .day, value: -365, to: Date())!

        // Set up some Weeks for testing
        let lastWeek = Week(start: fourteenDaysAgo)

        // Set up some Events for testing
        let pastDayEvent = Event(id: UUID(), start: yesterday, end: today, color: .red, title: "Testing")
        let pastYearEvent = Event(id: UUID(), start: oneYearAgoToday, end: Date(), color: .blue, title: "Testing")

        
        // Test Event & Week combos that overlap
        
        
        // Test Event & Week combos that have no overlap at all
        XCTAssert(pastDayEvent.isDuring(lastWeek) == false) // Because event was created before (although extremely slightly) week. Event does not fall inside of week.
        XCTAssert(lastWeek.isDuring(pastDayEvent) == false) // Because lastWeek was not during the during oneDayAgo and twoDaysAgo.
        
        // Test Event & Week combos that fit inside eachother
        XCTAssert(lastWeek.isDuring(pastYearEvent) == true)
        XCTAssert(pastYearEvent.isDuring(lastWeek) == true)
        
    }

}
