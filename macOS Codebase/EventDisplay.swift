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
    
    init() {
        node = SKShapeNode(rectOf: CGSize(width: 300, height: 300))
        
        node.fillColor = .blue
    }
    
}
