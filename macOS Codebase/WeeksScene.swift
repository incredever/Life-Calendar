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
        // Create Grid
        let grid = Grid()
        let gridLeftSidePadding = 60
        let gridTopPadding = 5
        grid.position = CGPoint(x: gridLeftSidePadding, y: Int(grid.ultimateSize.height) - gridTopPadding)
        addChild(grid)
        
        // Create Labels
        let labels = YearLabels()
        addChild(labels)
    }
    
}
