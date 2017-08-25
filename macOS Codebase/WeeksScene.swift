//
//  WeeksScene.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/8/17.
//

import Cocoa
import SpriteKit

/// A SpriteKit scene that contains a grid of tiles, each representing one week of a human life.
class WeeksScene: SKScene {
    
    var timeline: Timeline?
    
    override func didMove(to view: SKView) {
        let tempTimeline = Timeline(events: [], name: "temp timeline")
        
        // Create Grid
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-mm-dd"
        let myBirth = dateFormatter.date(from: "1993-01-05")!
        let possibleDeath = dateFormatter.date(from: "2083-01-04")!
        let size = CGSize(width: 330, height: 574)
        let gridPosition = CGPoint(x: 20, y: Int(size.height) - 10)

        let grid = WeeksGrid(start: myBirth, end: possibleDeath, position: gridPosition)

        addChild(grid.node)
        
        let centerOfScene = CGPoint(x: frame.width / 2, y: frame.height / 2)
        let testDot = SKShapeNode(circleOfRadius: 2)
        testDot.fillColor = .red
        testDot.position = centerOfScene
        addChild(testDot)

        let sidebarSize = CGSize(width: 150, height: frame.height)
        let sidebarPosition = CGPoint(x: frame.width - sidebarSize.width, y: frame.height)
        let sidebar = EventsDisplaySidebar(timeline: tempTimeline, size: sidebarSize)
        sidebar.position = sidebarPosition
        
        if let timeline = timeline {
            sidebar.timeline = timeline
        }
        
        let newTestDot = testDot.copy() as! SKShapeNode
        newTestDot.position = CGPoint(x: 0, y: 0)
        sidebar.node.addChild(newTestDot)

        addChild(sidebar.node)
    }
    
}
