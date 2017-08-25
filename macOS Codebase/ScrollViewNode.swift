//
//  ScrollViewNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/25/17.
//

import Foundation
import SpriteKit

class ScrollViewNode: SKShapeNode {
    
    override func scrollWheel(with event: NSEvent) {
        print(event)
    }
    
    override func mouseDown(with event: NSEvent) {
        print(event)
    }
    
}
