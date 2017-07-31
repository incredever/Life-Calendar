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
    }
    
}
