//
//  TilePopup.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/29/17.
//

import Cocoa
import SpriteKit

struct TilePopup {
    
    let node: SKNode!
    var displayText: String?
    
    init() {
        node = SKNode()
        
        // Create label
        let label = SKLabelNode(fontNamed: "Avenir Next")
        label.text = displayText ?? "Hello"
        label.fontColor = NSColor.red
        label.fontSize = 14
        label.position = CGPoint(x: -10, y: 5)
        
        node.addChild(label)
    }
    
}
