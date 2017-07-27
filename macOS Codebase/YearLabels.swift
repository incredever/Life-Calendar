//
//  YearLabels.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class YearLabels: SKNode {
    override init() {
        super.init()
        
        let firstLabel = SKLabelNode(fontNamed: "Avenir Next")
        firstLabel.text = "Hello World"
        firstLabel.fontColor = NSColor.darkGray
        firstLabel.fontSize = 14.0
        addChild(firstLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
