//
//  TimeSpan.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/31/17.
//

import Cocoa

// TODO: This little structure is a basically the same as DateInterval. So it's probably smart to eventually just use that with extentions as needed.

struct TimeSpan: Codable {
    let start: Date
    let end: Date
    
    var prettyDescription: String {
        return "\(start) - \(end)"
    }
}
