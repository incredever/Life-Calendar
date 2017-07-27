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
        
        for n in 1...10 {
            let x = 20
            let ySpacing = 50
            let y = (((ySpacing * n) * -1) + ySpacing + 25)
            
            let increment = 10
            let originalNumber = 1950
            let incrementedNumber = originalNumber + (increment * n)
            
            
            createLabel(at: CGPoint(x: x, y: y), with: incrementedNumber.description)
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
