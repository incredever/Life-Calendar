//
//  TilePopup.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/29/17.
//

import Cocoa
import SpriteKit

class TilePopup: SKNode {
    
    override init() {
        super.init()
        
        // Create background
        let background = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 20, height: 10))
        
        background.fillColor = NSColor.lightGray
        
        addChild(background)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
