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
    var position = CGPoint(x: 0, y: 0) {
        didSet {
            node.position = position
        }
    }
    
    /// The size in points of the square tile.
    var size = CGSize(width: 10, height: 10) {
        didSet {
            // TODO: update the nodes with new size
        }
    }
    
    /// The color of the tile.
    let color: Colors
    
    /// An SKShapeNode for use in a SpriteKit scene.
    var node: SKShapeNode
    
    /// Creates a Tile with default values.
    init() {
        node = SKShapeNode(rect: CGRect(origin: position, size: size))
        
        node.fillColor = NSColor(hexString: color.rawValue)
        node.lineWidth = 0.0
        node.position = position
    }
}
