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
        
        addTiles()
    }
    
    func addTiles() {
        let tileScene = SKScene(fileNamed: "Tile")
        let tileNode = tileScene?.childNode(withName: "Tile")
        
        addChild(tileNode!)
    }
}
