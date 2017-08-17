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
        print("Mouse down on GridNode: \(event.location(in: self))")
    }
    
}
