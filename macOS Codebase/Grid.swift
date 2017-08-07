//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class Grid {
    
    
    /// A SpriteKit node for use in the scene.
    let node = SKNode()
    
    /// The date for the first tile in the grid.
    let start: Date
    
    /// The date for the last tile in the grid.
    let end: Date
    
    /// An array of tiles spanning from the `start` date to `end` date - each representing a one week span of timne.
    var tiles: [Tile] = []
    
    /// The dimensions at which the grid will be generated.
    let size: CGSize // TODO: initialize as CGSize(width: 330, height: 574)

    
//    init(start: Date, end: Date) {
//        
//    }
    
    func generateGridOfTiles(rows: Int, columns: Int) {
        let padding = 2
        let tileSize = 4
        var currentSpan = next7Days(from: Date())

        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                let x = (tileSize + padding) * columnNumber
                let y = (tileSize + padding) * rowNumber * -1
                let tile = Tile(span: currentSpan, nodePosition: CGPoint(x: x, y: y))
                
                tiles.append(tile)
                node.addChild(tile.node)
                
                currentSpan = next7Days(from: currentSpan.end)
            }
        }
    }
    
    private func next7Days(from: Date) -> DateInterval {
        return DateInterval(start: from, duration: 604800)
    }
    
}
