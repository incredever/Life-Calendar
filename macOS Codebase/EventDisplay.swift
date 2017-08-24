//
//  EventDisplay.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/22/17.
//

import Foundation
import SpriteKit

class EventDisplay {
    
    var node: SKShapeNode
    
    let event: Event
    
    init(event: Event) {
        self.event = event
        
        let size = CGSize(width: 200, height: 200)
        
        node = SKShapeNode(rectOf: size)
        
        node.fillColor = .white
        
        let titleLabel = Label(text: event.title)
        titleLabel.fontSize = 16
        titleLabel.position = CGPoint(x: -(size.width / 2) + (titleLabel.width / 2) + 5,
                                      y: (size.height / 2) - (titleLabel.height / 2) - 8)

        node.addChild(titleLabel.node)
    }
    
}
