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
        for i in 0...4500 {
            weeks.append(previousWeek)
            let newWeek = Week(start: previousWeek.end)
            previousWeek = newWeek
        }
        return weeks
    }()
        
    var body: some View {
        FlowStack(columns: 52, numItems: weeks.count, alignment: .center) { index, colWidth in
            Color(red: 148/255, green: 148/255, blue: 148/255)
            .opacity(0.3)
            .frame(width: colWidth - 2.4, height: 4, alignment: .center)
            .padding(.top, 2.4)
        }
        .frame(width: 330, height: 568, alignment: .center)
    }
    
}
