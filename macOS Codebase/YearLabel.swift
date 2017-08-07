//
//  YearLabel.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/7/17.
//

import Foundation
import SpriteKit


struct YearLabel {
    
    var node: SKLabelNode!
    
    init(text: String, font: Fonts, size: Int, color: Colors, position: CGPoint) {
        node = SKLabelNode(fileNamed: font.rawValue)
        
        node.text = text
        node.fontColor = NSColor(hexString: color.rawValue)
        node.fontSize = CGFloat(size)
        node.position = position
    }
}
