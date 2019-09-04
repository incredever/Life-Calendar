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

    var body: some View {

        FlowStack(columns: 3, numItems: 27, alignment: .leading) { index, colWidth in
          Text(" \(index) ").frame(width: colWidth)
        }
    
    }
    
}
