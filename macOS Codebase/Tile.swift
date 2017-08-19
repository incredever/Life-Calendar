//
//  Tile.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/26/17.
//

import Cocoa
import SpriteKit

/// A small square that represents one week of a human life.
class Tile {
    
    /// The event that has been set for this tile; Effects the appearance and selection behavior.
    var associatedEvent: Event?
    
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
            let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let path = CGPath(rect: rect, transform: nil)

            node.path = path
        }
    }
    
    /// The color of the tile.
    var color = Color.blankTile {
        didSet {
            node.fillColor = NSColor(hexString: color.rawValue)
        }
    }
    
    /// An SKShapeNode for use in a SpriteKit scene.
    var node: SKShapeNode
    
    /// Creates a Tile with default values.
    init(span: DateInterval) {
        node = SKShapeNode(rect: CGRect(origin: position, size: size))
        
        node.fillColor = NSColor(hexString: color.rawValue)
        node.lineWidth = 0.0
        node.position = position
        
        self.span = span
    }
    
}
