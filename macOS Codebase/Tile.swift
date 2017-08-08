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
    
    /// The span of time which the tile represents.
    let span: DateInterval
    
    /// The point at which the tile will position itself within its parent's coordinate system.
    var position: CGPoint
    
    /// An SKShapeNode for use in a SpriteKit scene.
    var node: SKShapeNode {
        return SKShapeNode()
    }
}
