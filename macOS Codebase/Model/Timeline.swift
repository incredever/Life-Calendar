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
    
//    func encode(to encoder: Encoder) throws {
//
//    }
//
//    init(from decoder: Decoder) throws {
//
//    }
    
    

    
    func saveToDesktop() {
        
        let encoder = JSONEncoder()
        let json = try? encoder.encode(self)
        
        FileManager.default.createFile(atPath: "/Users/wes/Desktop/test.txt", contents: json, attributes: nil)
    }
}
