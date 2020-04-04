//
//  Life_Calendar_Tests.swift
//  Life Calendar Tests
//
//  Created by Wesley Van der Klomp on 4/4/20.
//  Copyright © 2020 wes. All rights reserved.
//

import XCTest
@testable import Life_Calendar

class Life_Calendar_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        //measure {
            // Put the code you want to measure the time of here.
        //}
    }
    
    func testEventIsDuring() throws {
        
        let calendar = Calendar.current

        let fourteenDaysAgo = calendar.date(byAdding: .day, value: -14, to: Date())!
        let lastWeek = Week(start: fourteenDaysAgo)

        
        let today = calendar.date(byAdding: .day, value: 0, to: Date())!
        let yesterday = calendar.date(byAdding: .day, value: -1, to: Date())!
        let thePastDay = Event(id: UUID(), start: yesterday, end: today, color: .red, title: "Testing")
        
        XCTAssert(thePastDay.isDuring(lastWeek) == false) // Because event was created before (although extremely slightly) week. Event does not fall inside of week.
        
        XCTAssert(lastWeek.isDuring(thePastDay) == false) // Because lastWeek was not during the during oneDayAgo and twoDaysAgo.
        
    }

}
