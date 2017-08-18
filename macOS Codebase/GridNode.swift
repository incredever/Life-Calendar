//
//  GridNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/17/17.
//

import Foundation
import SpriteKit

class GridNode: SKNode {
    
    var owner: Grid? = nil
    
    override func mouseDown(with event: NSEvent) {
        if owner != nil {
            owner?.click(at: event.location(in: self))
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        if owner != nil {
            owner?.drag(at: event.location(in: self))
        }
    }
    
}
