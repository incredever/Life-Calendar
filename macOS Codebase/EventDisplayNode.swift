//
//  EventDisplayNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/28/17.
//

import Foundation
import SpriteKit

class EventDisplayNode: SKShapeNode {
    
    var owner: EventDisplay?
    
    init(size: CGSize, owner: EventDisplay? = nil) {
        super.init()
        
        let bottomLeftCorner = CGPoint(x: -(size.width / 2), y: 0)
        let rect = CGRect(origin: bottomLeftCorner, size: size)
        self.path = CGPath(rect: rect, transform: nil)
        self.fillColor = NSColor(calibratedRed: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
        self.position = position
        self.owner = owner
        self.isUserInteractionEnabled = true
    }
    
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    
//    override func mouseDown(with event: NSEvent) {
//        if owner != nil {
//            owner?.mouseDown(at: event.location(in: self))
//        }
//    }
//
//    override func mouseDragged(with event: NSEvent) {
//        if owner != nil {
//            owner?.mouseDragged(at: event.location(in: self))
//        }
//    }
//
//    override func mouseUp(with event: NSEvent) {
//        if owner != nil {
//            owner?.mouseUp(at: event.location(in: self))
//        }
//    }
//
    override func mouseMoved(with event: NSEvent) {
        print("mouse moved: \(event)")
        
        self.fillColor = NSColor(calibratedRed: 1.0, green: 0.0, blue: 0.0, alpha: 0.3)


//        if owner != nil {
//            owner?.mouseMoved(at: event.location(in: self))
//        }
    }
    
}
