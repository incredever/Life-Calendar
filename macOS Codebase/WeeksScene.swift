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
        
        grid.node.position = CGPoint(x: gridLeftSidePadding, y: Int(grid.ultimateSize.height) - gridTopPadding)
        
        addChild(grid.node)
        
        // Create Labels
        let labels = YearLabels()
        let labelsLeftSidePadding = 25
        let labelsTopPadding = 5
        
        labels.position = CGPoint(x: labelsLeftSidePadding, y: Int(labels.ultimiteSize.height) - labelsTopPadding)
        
        addChild(labels)
        
        // add test tracking area
        let trackingArea = NSTrackingArea(rect: view.frame, options: [NSTrackingArea.Options.activeInKeyWindow, NSTrackingArea.Options.mouseMoved], owner: self, userInfo: nil)
        // Add the tracking area to the view
        view.addTrackingArea(trackingArea)
    }
    
    override func mouseMoved(with theEvent: NSEvent) {
        let location = theEvent.location(in: self)
        print(location)
    }
}
