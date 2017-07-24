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
        
        skScene = WeeksScene(size: CGSize(width: 600, height: 600))
        skScene?.backgroundColor = NSColor(colorLiteralRed: 246/255, green: 244/255, blue: 241/255, alpha: 1)
        skScene?.scaleMode = .aspectFit
        skView.presentScene(skScene)
    }
    
}
