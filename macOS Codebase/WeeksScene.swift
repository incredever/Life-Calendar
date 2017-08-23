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
        
        let tempTimeline = Timeline(events: [], name: "temp timeline")
        
        // Create Grid
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
        let myBirth = dateFormatter.date(from: "1993-01-05")!
        let possibleDeath = dateFormatter.date(from: "2093-01-04")!
        let size = CGSize(width: 330, height: 574)
        let gridPosition = CGPoint(x: 20, y: Int(size.height) - 10)

        let grid = WeeksGrid(start: myBirth, end: possibleDeath, position: gridPosition)

        addChild(grid.node)
        
        let sidebar = EventsDisplaySidebar(timeline: tempTimeline)
        sidebar.position = CGPoint(x: Int(frame.width) - Int(sidebar.size.width / 2.0), y: Int(frame.height))
        
        addChild(sidebar.node)
    }
    
}
