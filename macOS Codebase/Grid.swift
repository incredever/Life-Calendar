//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class Grid: SKNode {
    
    let ultimateSize = CGSize(width: 330, height: 574)
    
    /*********
     size of grid
     positioning entire grid
     flip the grid so the tiles can be generated with increasing values
    
     
     Grid size: 330x574
     Grid position in scene: CGPoint(x: 330 + leftPadding, y: 574 + bottomPadding)
     Tile size: 4x4
     Tile padding: 3
     
    **********/
    
    override init() {
        super.init()
        
        createGridOfTiles(rows: 90, columns: 52)
    }
    
    func createGridOfTiles(rows: Int, columns: Int) {
        let padding = 2
        let tileSize = 4
        
        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                let x = (tileSize + padding) * columnNumber
                let y = (tileSize + padding) * rowNumber * -1
                addTile(at: CGPoint(x: x, y: y))
            }
        }
    }
    
    func addTile(at position: CGPoint) {
        let tile = Tile()
        tile.position = position
        addChild(tile)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
