//
//  Event.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/30/17.
//

import Cocoa
import SpriteKit

struct Event: Codable {
    let title: String
    let colorHex: String
    let starting: Date
    let ending: Date
}
