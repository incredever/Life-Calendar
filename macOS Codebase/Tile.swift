//
//  Tile.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/8/17.
//

import Cocoa
import SpriteKit

class Tile: SKNode {
    override init() {
        super.init()
        
        let blankTile = SKSpriteNode.init(imageNamed: "Blank Tile")
        
        addChild(blankTile)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
