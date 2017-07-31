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
    
    init() {
        node = SKNode()
        
        // Create background
        let background = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 20, height: 10))
        background.fillColor = NSColor.lightGray
        node.addChild(background)
        
        node.position = CGPoint(x: -10, y: 5)
        
        // Create label
        let label = SKLabelNode(fontNamed: "Avenir Next")
        label.text = "Hello"
        label.fontColor = NSColor.red
        label.fontSize = 14
        label.position = CGPoint(x: -10, y: 5)
        
        node.addChild(label)
    }
    
}
