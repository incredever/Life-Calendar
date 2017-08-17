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
            n.addChild(tile.node)
        }

        return n
    }

    /// An array of tiles spanning from the `start` date to `end` date. Each tile represents a one week.
    var tiles: [Tile]
    
    /// The dimensions at which the grid will be generated.
    let size: CGSize
    
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
        
        /// A span of seven days, incrementing by one week for every cycle in loops below.
        var currentSpan = DateInterval.oneWeek(startingFom: start)
        
        for yearNumber in 0...span.numberOfYearsWithin() {
            for weekNumber in 1...52 {
                let y = (tileSize + tilePadding) * yearNumber * -1
                let x = (tileSize + tilePadding) * weekNumber
                let tSize = CGSize(width: tileSize, height: tileSize)
                let tColor = Color.blankTile
                let t = Tile(span: currentSpan, position: CGPoint(x: x, y: y), size: tSize, color: tColor)
                
                tiles.append(t)
                
                currentSpan = DateInterval.oneWeek(startingFom: span.end)
            }
        }
    }
}
