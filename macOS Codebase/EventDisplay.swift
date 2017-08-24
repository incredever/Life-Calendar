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
        
        node = SKShapeNode(rectOf: CGSize(width: 300, height: 300))
        
        node.fillColor = .blue
        
        let titleLabel = Label(text: "test title")
        
        node.addChild(titleLabel.node)
    }
    
}
