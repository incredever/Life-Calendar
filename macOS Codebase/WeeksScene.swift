//
//  WeeksScene.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/8/17.
//

import Cocoa
import SpriteKit

/// A SpriteKit scene that contains a grid of tiles, each representing one week of a human life.
///
/// Tiles have colors indicating a certain time of the human's life. Every tile is interactive, showing a small popup when the mouse hovers over it. Tiles are also selectable by clicking and dragging. The selection is turned into a new "event", which the user can choose to dismiss or fill out information for and save for posterity.
class WeeksScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Create Grid
        let grid = Grid()
        let gridLeftSidePadding = 90
        let gridTopPadding = 5
        
        grid.node.position = CGPoint(x: gridLeftSidePadding, y: Int(grid.ultimateSize.height) - gridTopPadding)
        
        addChild(grid.node)
        
        grid.generateGridOfTiles(rows: 90, columns: 52)
        
        /// A `YearLabels` instance for displaying the year spanning the human's life.
        let labels = YearLabels()
        
        let labelsLeftSidePadding = 25
        let labelsTopPadding = 5
        
        labels.position = CGPoint(x: labelsLeftSidePadding, y: Int(labels.ultimiteSize.height) - labelsTopPadding)
        
        addChild(labels)
        
//        // add test tracking area
//        let trackingArea = NSTrackingArea(rect: view.frame, options: [NSTrackingArea.Options.activeInKeyWindow, NSTrackingArea.Options.mouseMoved], owner: self, userInfo: nil)
//        // Add the tracking area to the view
//        view.addTrackingArea(trackingArea)
    }
    
//    override func mouseMoved(with theEvent: NSEvent) {
//        let location = theEvent.location(in: self)
//
//        print(location)
//    }
    
}
