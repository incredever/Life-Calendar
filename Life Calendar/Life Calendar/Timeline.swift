//
//  Timeline.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/4/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct Timeline: View {
    
    @State private var weeks: [Week] = {
        var weeks: [Week] = []
        var previousWeek = Week(start: Date())
        for i in 0...100 {
            weeks.append(previousWeek)
            let newWeek = Week(start: previousWeek.end)
            previousWeek = newWeek
        }
        return weeks
    }()
    
    var happenings: [Happening] = [
    
    
        Happening(id: 0, start: Date(), end: Date(), color: .red, title: "Birth"),
        Happening(id: 1, start: Date(), end: Date(), color: .red, title: "School"),
        Happening(id: 2, start: Date(), end: Date(), color: .red, title: "Death")
        
    ]

    var body: some View {
        
        VStack {
            List(happenings) { happening in
                Text("Happening: \(happening.title)")
            }
            List(weeks) { week in
                Text("Week: \(week.start)")
            }
            Text("The END")
        }
        
    }
    
}
