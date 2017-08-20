//
//  Label.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/7/17.
//

import Foundation
import SpriteKit

/// A label for indicating the year for a particular row of the grid.
struct Label {
    
    /// The text displayed by the label. Since this is a *Year*Label, it should probably be a year, as in "1900" or "2017".
    var text: String
    
    /// The point at which the label will position itself within its parent's coordinate system.
    var position: CGPoint
    
    /// The font to be used for displaying text.
    var fontName: Font
    
    /// The color the text should display as.
    var fontColor: Color
    
    /// The size in points the text should display at.
    var fontSize: Double
    
    /// An SKLabelNode for use in a SpriteKit scene.
    var node: SKLabelNode {
        let node = SKLabelNode(fontNamed: self.fontName.rawValue)
        
        node.text = self.text
        node.fontColor = NSColor(hexString: self.fontColor.rawValue)
        node.fontSize = CGFloat(self.fontSize)
        node.position = self.position
        
        return node
    }
    
    /// The primary initializer, containing parameters for all pertinent variables.
    private init(text: String, font: Font, size: Double, color: Color, position: CGPoint) {

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
