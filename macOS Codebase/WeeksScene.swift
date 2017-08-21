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
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
        let myBirth = dateFormatter.date(from: "1993-01-05")!
        let possibleDeath = dateFormatter.date(from: "2093-01-04")!
        let size = CGSize(width: 330, height: 574)
        let gridLeftSidePadding = 90
        let gridTopPadding = 5
        let gridPosition = CGPoint(x: gridLeftSidePadding, y: Int(size.height) - gridTopPadding)

        let grid = Grid(start: myBirth, end: possibleDeath, size: size, position: gridPosition)

        addChild(grid.node)
        
        /// A `YearLabels` instance for displaying the year spanning the human's life.
        let labels = YearLabels()
        
        let labelsLeftSidePadding = 25
        let labelsTopPadding = 5
        
        labels.position = CGPoint(x: labelsLeftSidePadding, y: Int(labels.ultimiteSize.height) - labelsTopPadding)
        
        addChild(labels)
    }
    
}
