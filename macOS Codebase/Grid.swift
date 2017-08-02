//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

struct Grid {
    
    let ultimateSize = CGSize(width: 330, height: 574)
    let node: GridNode!
    let startDate = birth!
    let endDate = death!
    
    init() {
        node = GridNode()
        
        generateGridOfTiles(rows: 90, columns: 52)
    }
    
    private func generateGridOfTiles(rows: Int, columns: Int) {
        let padding = 2
        let tileSize = 4
        var currentSpan = next7Days(from: Date())
        
        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                let x = (tileSize + padding) * columnNumber
                let y = (tileSize + padding) * rowNumber * -1
                
                addTile(at: CGPoint(x: x, y: y), span: currentSpan)
                
                currentSpan = next7Days(from: currentSpan.end)
            }
        }
    }
    
    private func next7Days(from: Date) -> TimeSpan {
        let to = from.addingTimeInterval(604800)
        
        return TimeSpan(start: from, end: to)
    }
    
    private func addTile(at position: CGPoint, span: TimeSpan) {
        let tile = Tile()
        
        tile.node.position = position
        
        node.addChild(tile.node)
    }
    
    // Go through every tile and check if it falls under an event in timeline. And if so, update the color of tile.
    func updateTiles(for timeline: Timeline) {
        
    }
    
}
