//
//  Tile.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/26/17.
//

import Cocoa
import SpriteKit

class Tile: SKShapeNode {
    override init() {
        super.init()
        
        // Create square
        let rect = CGRect(x: 0, y: 0, width: 4, height: 4)
        self.path = CGPath(rect: rect, transform: nil)
        fillColor = NSColor.clear
        strokeColor = NSColor.darkGray
        lineWidth = 0.1

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
