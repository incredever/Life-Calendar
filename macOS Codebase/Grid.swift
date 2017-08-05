//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class Grid {
    
    let ultimateSize = CGSize(width: 330, height: 574)
    let node = SKNode()
    let startDate = birth!
    let endDate = death!
    var tiles: [Tile] = []
    
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
