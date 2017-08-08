//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

/// A grid of tiles, each representing one week of a human life.
struct Grid {
    
    /// The date for the first tile in the grid.
    let start: Date
    
    /// The date for the last tile in the grid.
    let end: Date
    
    /// An SKNode for use in a SpriteKit scene.
    var node: SKNode {
        let n = SKNode()
        
        n.position = position
        
        for tile in tiles {
//            n.addChild(tile.node)
        }

        return n
    }

    /// An array of tiles spanning from the `start` date to `end` date. Each tile represents a one week.
    var tiles: [Tile]
    
    /// The dimensions at which the grid will be generated.
    let size: CGSize // TODO: initialize as CGSize(width: 330, height: 574)
    
    /// The point at which the grid will position itself within its parent's coordinate system.
    var position: CGPoint
    
    /// The size each square tile should be in points.
    private let tileSize = 4
    
    /// The number of points to put between each tile.
    private let tilePadding = 2
    
    /// The span of time between `start` and `end`.
    private var span: DateInterval {
        return DateInterval(start: start, end: end)
    }
    
    /// Creates a grid which shows tiles for every week between `start` and `end`.
    init(start: Date, end: Date, size: CGSize, position: CGPoint) {
        self.start = start
        self.end = end
        self.size = size
        self.position = position
        self.tiles = []
        
        for yearNumber in 0...span.numberOfYearsWithin() {
            for weekNumber in 1...52 {
                // TODO: create a Tile with proper span and position. Then add it to `tiles`.
                print("yearNumber: \(yearNumber)\nweekNumber: \(weekNumber)")
            }
        }
    }
}
