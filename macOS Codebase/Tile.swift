//
//  Tile.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/26/17.
//

import Cocoa
import SpriteKit

class Tile {
    
    let span: TimeSpan?
    let node: SKShapeNode?
    
    init() {
        span = nil

        // Create node
        node = SKShapeNode()
        let rect = CGRect(x: 0, y: 0, width: 4, height: 4)
        node?.path = CGPath(rect: rect, transform: nil)
        node?.fillColor = NSColor.clear
        node?.strokeColor = NSColor.darkGray
        node?.lineWidth = 0.1
    }
    
}
