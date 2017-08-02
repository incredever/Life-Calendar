//
//  GridNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/31/17.
//

import Cocoa
import SpriteKit

class GridNode: SKNode {
    
    override init() {
        super.init()
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func mouseMoved(with event: NSEvent) {
        
        // find Tile that is located at event.location and displayPopup on it. hidePopup on all others.
        
    }
    
}
