//
//  GridNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/31/17.
//

import Cocoa
import SpriteKit

class GridNode: SKNode {
    
    private var currentTilePopup = TilePopup()
    
    override init() {
        super.init()
        
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func mouseMoved(with event: NSEvent) {
        print("Grid - mouse moved: \(event.location(in: self))")
        currentTilePopup.node.removeFromParent()
        
        let nodes = self.nodes(at: event.location(in: self))
        
        for node in nodes {
            node.addChild(currentTilePopup.node)
        }
    }
    
}
