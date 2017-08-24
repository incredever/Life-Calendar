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

    var title: String
    
    init(title: String) {
        self.title = title
        
        let size = CGSize(width: 200, height: 200)
        
        node = SKShapeNode(rectOf: size)
        
        node.fillColor = .white
        
        let titleLabel = Label(text: title)
        titleLabel.position = CGPoint(x: -(size.width / 2) + (titleLabel.width / 2) + 5,
                                      y: (size.height / 2) - (titleLabel.height / 2) - 5)
        
        node.addChild(titleLabel.node)
    }
    
}
