//
//  YearLabels.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class YearLabels: SKNode {
    
    let ultimiteSize = CGSize(width: 30, height: 500)
    
    override init() {
        super.init()
        
        for n in 0...10 {
            createLabel(at: CGPoint(x: 10, y: 10), with: "1995")
        }
        
    }
    
    func createLabel(at position: CGPoint, with string: String) {
        let firstLabel = SKLabelNode(fontNamed: "Avenir Next")
        
        firstLabel.text = string
        firstLabel.fontColor = NSColor.darkGray
        firstLabel.fontSize = 14
        firstLabel.position = position
        
        addChild(firstLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
