//
//  Timeline.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/30/17.
//

import Cocoa

struct Timeline {
    let events: [Event]
    
    func saveToDesktop() {
        FileManager.default.createFile(atPath: "/Users/wes/Desktop/test.txt", contents: nil, attributes: nil)
    }
}
