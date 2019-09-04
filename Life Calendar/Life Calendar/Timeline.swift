//
//  Timeline.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/4/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct Item {
    var image: String
    var label: String
}


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
    
    
    let items = [
        Item(image: "hand.thumbsup", label: "Up"),
        Item(image: "tortoise", label: "Tortoise"),
        Item(image: "forward", label: "Forward"),
        Item(image: "hand.thumbsdown", label: "Down"),
        Item(image: "hare", label: "Hare"),
        Item(image: "backward", label: "Backward")
    ]
    
    var body: some View {
        
        FlowStack(columns: 3, numItems: items.count, alignment: .leading) { index, colWidth in
            Button(action: {
                print("Tap \(index)!")
            }) {
                Image(self.items[index].image)
                Text(self.items[index].label).font(Font.caption)
            }
            .padding()
            .frame(width: colWidth)
        }
        
    }
    
}
