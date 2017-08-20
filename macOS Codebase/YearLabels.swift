//
//  YearLabels.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

/*
 
  the years need to be at the vertical position relative to the rows of the years listed in the grid
 
 how tall is each row of the grid
 what the start and end years of the grid are
 
*/

@available(*, deprecated: 0.1, message: "I'm thinking about doing this a different way. Work in progress. Probably take a look at Grid.")
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
            
            let label = Label(text: incrementedNumber.description, position: CGPoint(x: x, y: y))
            addChild(label.node)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
