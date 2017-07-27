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
        
        self.path = CGPath(rect: CGRect(x: 0, y: 0, width: 10, height: 10), transform: nil)
        fillColor = NSColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
