//
//  WeeksViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/7/17.
//

import Cocoa
import SpriteKit

class WeeksViewController: NSViewController {
    
    @IBOutlet weak var skView: SKView!
    var skScene: SKScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView.showsNodeCount = true
        
        skScene = SKScene(fileNamed: "WeeksScene")
        skScene?.scaleMode = .aspectFill
        
        skView.presentScene(skScene)
        
        addTilesToScene()
        
    }
    
    func addTilesToScene() {
        let tileScene = SKScene(fileNamed: "Tile")
        let tileNode = tileScene?.childNode(withName: "Tile")
        
        
        
        if let tileNode = tileNode {
            skScene?.addChild(tileNode)
        }
        
        skScene?.addChild(SKNode())
    }
    
}
