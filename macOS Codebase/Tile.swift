//
//  Tile.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/26/17.
//

import Cocoa
import SpriteKit

/// A small square that represents one week of a human life.
struct Tile {
    
    let span: DateInterval
    
    var node: SKShapeNode {
        return SKShapeNode()
    }
}
