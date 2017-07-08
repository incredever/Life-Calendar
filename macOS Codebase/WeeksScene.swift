//
//  WeeksScene.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/8/17.
//

import Cocoa
import SpriteKit

class WeeksScene: SKScene {
    
    override func didMove(to view: SKView) {
        print("did move to view")
        
        addTile(at: CGPoint(x: 0, y: 0))
    }
    
    func addTile(at position: CGPoint) {
        let tile = Tile()
        tile.position = position
        addChild(tile)
    }
}
