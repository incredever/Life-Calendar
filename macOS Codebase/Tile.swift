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
        fillColor = NSColor.lightGray
        
        // Settings
//        isUserInteractionEnabled = true
    }
    

//    override func mouseEntered(with event: NSEvent) {
//        print("found mouse hover")
//    }
    
//    override func mouseMoved(with event: NSEvent) {
//        let popup = TilePopup()
//
//        addChild(popup)
//    }
//
//    override func mouseDown(with event: NSEvent) {
//        print("Mouse down")
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
