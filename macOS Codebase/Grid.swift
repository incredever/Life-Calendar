//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class Grid: SKNode {
    
    override init() {
        super.init()
        
        createGridOfTiles(rows: 10, columns: 10)
    }
    
    func createGridOfTiles(rows: Int, columns: Int) {
        let padding = 5
        let SIZEOFTILE = 35
        
        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                addTile(at: CGPoint(x: ((SIZEOFTILE * rowNumber) + padding), y: ((SIZEOFTILE * columnNumber) + padding) * -1))
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
