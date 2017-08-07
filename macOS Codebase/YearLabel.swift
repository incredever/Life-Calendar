//
//  YearLabel.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/7/17.
//

import Foundation
import SpriteKit

/// A label for indicating the year for a particular row of the grid.
struct YearLabel {
    
    /// A SpriteKit node for use in the scene.
    var node: SKLabelNode {
        let node = SKLabelNode(fontNamed: self.fontName.rawValue)
        
        node.text = self.text
        node.fontColor = NSColor(hexString: self.fontColor.rawValue)
        node.fontSize = CGFloat(self.fontSize)
        node.position = self.position
        
        return node
    }
    
    var text: String
    var position: CGPoint
    var fontName: Fonts
    var fontColor: Colors
    var fontSize: Int
    
    /// The primary initializer, containing parameters for all pertinent variables.
    private init(text: String, font: Fonts, size: Int, color: Colors, position: CGPoint) {

        self.text = text
        self.position = position
        self.fontName = font
        self.fontColor = color
        self.fontSize = size
    }

    /// Creates a year label with default styling and position.
    init(text: String) {
        
        self.init(text: text, font: .yearLabel, size: 14, color: .yearLabelBlack, position: CGPoint(x: 0, y: 0))
    }
    
    /// Creates a year label with default styling at a custom position.
    init(text: String, position: CGPoint) {
        self.init(text: text, font: .yearLabel, size: 14, color: .yearLabelBlack, position: position)
    }
    
}
