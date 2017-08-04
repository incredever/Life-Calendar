//
//  TilePopup.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/29/17.
//

import Cocoa
import SpriteKit

/// A small popup that displays information about it's respective tile.
struct TilePopup {
    
    /// The popup's top level node for adding to the scene hierarchy.
    let node = SKNode()
    
    /// The text that the popup displays. Automatically updates the view when set.
    var displayText: String? {
        didSet {
            label.text = displayText ?? "Hello World!"
        }
    }
    
    /// The main display label. Automatically updated by setting `displayText`.
    private var label = SKLabelNode(fileNamed: "Avenir Next")!
    
    /// Creates a popup with default "Hello World!" display text. Set the `displayText` property to change.
    init() {
        label.fontColor = NSColor.red
        label.fontSize = 14
        label.position = CGPoint(x: -10, y: 5)
        
        node.addChild(label)
    }
    
}
