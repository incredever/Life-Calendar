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
        
        self.path = CGPath(rect: CGRect(x: 0, y: 0, width: 4, height: 4), transform: nil)
        fillColor = NSColor.lightGray
        
        isUserInteractionEnabled = true
    }
    

    override func mouseEntered(with event: NSEvent) {
        print("found mouse hover")
    }
    
    override func mouseMoved(with event: NSEvent) {
        print("tile - mouse moved: \(event.location(in: self))")
        fillColor = NSColor.red
    }
    
    override func mouseDown(with event: NSEvent) {
        print("Mouse down")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
