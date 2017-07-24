//
//  WeeksViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/7/17.
//

import Cocoa
import SpriteKit

/// The hierarchy: NSViewController > NSView > SKView > SKScene. All this is acheved inside the `loadView` and `viewDidLoad` methods.
class WeeksViewController: NSViewController {
    
    var skView: SKView!
    var skScene: SKScene?
    
    override func loadView() {
        

        view = NSView(frame: NSRect(x: 0, y: -22, width: 600, height: 600))
        skView = SKView(frame: NSRect(x: 0, y: -22, width: 600, height: 600))
        
        view.mouseDownCanMoveWindow = true
        skView.mouseDownCanMoveWindow = true
        
        view.addSubview(skView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skScene = WeeksScene(size: view.frame.size)
        skScene?.backgroundColor = NSColor(colorLiteralRed: 246/255, green: 244/255, blue: 241/255, alpha: 1)
        skScene?.scaleMode = .aspectFit
        skView.presentScene(skScene)
    }
    
}
