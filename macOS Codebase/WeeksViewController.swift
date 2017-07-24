//
//  WeeksViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/7/17.
//

import Cocoa
import SpriteKit

class WeeksViewController: NSViewController {
    
    private let rect = NSRect(x: 0, y: 0, width: 600, height: 600)
    var skView: SKView!
    var skScene: SKScene?
    
    override func loadView() {
        view = NSView(frame: rect)
        skView = SKView(frame: rect)
        
        view.addSubview(skView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skScene = WeeksScene(size: rect.size)
        skScene?.backgroundColor = NSColor(colorLiteralRed: 246/255, green: 244/255, blue: 241/255, alpha: 1)
        skScene?.scaleMode = .aspectFit
        skView.presentScene(skScene)
    }
    
}
