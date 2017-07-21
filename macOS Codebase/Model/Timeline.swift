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
        
        let dir = "/Users/wes/Documents/Life Calendar/"
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
        FileManager.default.createFile(atPath: "\(dir)\(name).txt", contents: json, attributes: nil)
    }
}
