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
    
    /// A SpriteKit node for use in the scene.
    var node: SKNode {
        let n = SKNode()
        
        n.position = position
        
        for tile in tiles {
            n.addChild(tile.node)
        }

        return n
    }

    /// An array of tiles spanning from the `start` date to `end` date - each representing a one week span of timne.
    var tiles: [Tile]
    
    /// The dimensions at which the grid will be generated.
    let size: CGSize // TODO: initialize as CGSize(width: 330, height: 574)
    
    /// The point at which the grid will position itself within the scene.
    var position: CGPoint
    
    /// The size each square tile should be in points.
    private let tileSize = 4
    
    /// The number of points to put between each tile.
    private let tilePadding = 2
    
    init(start: Date, end: Date, size: CGSize) {
        self.start = start
        self.end = end
        self.size = size
        
        var tilesInProgress: [Tile] = []
        
        var currentSpan = next7Days(from: Date())
        
        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                let x = (tileSize + tilePadding) * columnNumber
                let y = (tileSize + tilePadding) * rowNumber * -1
                let tile = Tile(span: currentSpan, nodePosition: CGPoint(x: x, y: y))
                
                tiles.append(tile)
                
                currentSpan = next7Days(from: currentSpan.end)
            }
        }
        
        self.tiles = tilesInProgress

    }
    
    private func next7Days(from: Date) -> DateInterval {
        return DateInterval(start: from, duration: 604800)
    }
    
}
