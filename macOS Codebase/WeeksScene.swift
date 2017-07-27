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
        let gridLeftSidePadding = 90
        let gridTopPadding = 5
        
        grid.position = CGPoint(x: gridLeftSidePadding, y: Int(grid.ultimateSize.height) - gridTopPadding)
        
        addChild(grid)
        
        // Create Labels
        let labels = YearLabels()
        let labelsLeftSidePadding = 25
        let labelsTopPadding = 5
        
        labels.position = CGPoint(x: labelsLeftSidePadding, y: Int(labels.ultimiteSize.height) - labelsTopPadding)
        
        addChild(labels)
    }
    
    override func mouseMoved(with event: NSEvent) {
        print("mouse moved")
    }
    
}
