//
//  Timeline.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/30/17.
//

import Cocoa

struct Timeline: Codable {
//    let events: [Event]
    let name: String
    
    func saveToDesktop() {
        let encoder = JSONEncoder()
        let json = try? encoder.encode(self)
        
        FileManager.default.createFile(atPath: "/Users/wes/Desktop/\(name).txt", contents: json, attributes: nil)
    }
}
