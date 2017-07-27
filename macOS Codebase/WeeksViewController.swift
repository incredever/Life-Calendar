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
    weak var window: NSWindow?
    
    override func loadView() {
        let windowSize = window?.frame.size ?? CGSize(width: 0, height: 0)
        
        view = NSView(frame: NSRect(x: 0, y: 0, width: windowSize.width, height: windowSize.height + 22))
        skView = SKView(frame: NSRect(x: 0, y: 0, width: windowSize.width, height: windowSize.height))
        
        view.addSubview(skView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skScene = WeeksScene(size: skView.frame.size)
        skScene?.backgroundColor = NSColor(hexString: Colors.sceneBackground.rawValue)
        skScene?.scaleMode = .aspectFill
        skView.presentScene(skScene)
    }
    
}
