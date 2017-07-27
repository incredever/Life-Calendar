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
        let grid = Grid()
        
        grid.position = CGPoint(x: 100, y: 100)
        
        addChild(grid)
    }
    
}
