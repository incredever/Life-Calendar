//
//  Tile.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/26/17.
//

import Cocoa
import SpriteKit

/// A small square the represents one week of a human life.
struct Tile {
    
    let span: DateInterval?
    let node: SKShapeNode!
    private var popup: TilePopup?
    
    /// Creates an instance with a blank grey `node` and `span` set to nil.
    init() {
        span = nil

        // Create node
        node = SKShapeNode()
        
        let rect = CGRect(x: 0, y: 0, width: 4, height: 4)
        
        node.path = CGPath(rect: rect, transform: nil)
        node.fillColor = NSColor.clear
        node.strokeColor = NSColor.darkGray
        node.lineWidth = 0.1
    }
    
    mutating func displayPopup() {
        popup = TilePopup()
        popup?.displayText = "testing 123"
        
        node.addChild(popup!.node)
    }
    
    mutating func hidePopup() {
        if let popup = popup {
            popup.node.removeFromParent()
        }
        
        popup = nil
    }
}
