//
//  WeeksScene.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/8/17.
//

import Cocoa
import SpriteKit

class WeeksScene: SKScene {
    
    override func didMove(to view: SKView) {
        print("did move to view")
        
        createGridOfTiles(rows: 100, columns: 52)
    }
    
    func createGridOfTiles(rows: Int, columns: Int) {
        let padding = 5
        let SIZEOFTILE = 20
        
        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                addTile(at: CGPoint(x: (SIZEOFTILE * rowNumber) + padding, y: (SIZEOFTILE + columnNumber) + padding))
            }
        }
    }
    
    func addTile(at position: CGPoint) {
        let tile = Tile()
        tile.position = position
        addChild(tile)
    }
}
