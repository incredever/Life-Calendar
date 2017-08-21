//
//  WeeksGridNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/17/17.
//

import Foundation
import SpriteKit

class WeeksGridNode: SKNode {
    
    var owner: WeeksGrid? = nil
    
    init(position: CGPoint, owner: WeeksGrid? = nil) {
        super.init()
        
        self.position = position
        self.owner = owner
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with event: NSEvent) {
        if owner != nil {
            owner?.mouseDown(at: event.location(in: self))
        }
    }
    
    override func mouseDragged(with event: NSEvent) {
        if owner != nil {
            owner?.mouseDragged(at: event.location(in: self))
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        if owner != nil {
            owner?.mouseUp(at: event.location(in: self))
        }
    }
    
}
