//
//  EventsDisplaySidebar.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/22/17.
//

import Foundation
import SpriteKit

class EventsDisplaySidebar {
    
    var timeline: Timeline
    
    var node: SKShapeNode
    
    var size = CGSize(width: 200, height: 600) {
        didSet {
            // TODO: update the nodes dimensions
        }
    }
    
    var position = CGPoint(x: 0, y: 0) {
        didSet {
            node.position = position
        }
    }
    
    private var eventDisplays: [EventDisplay] = []
    
    init(timeline: Timeline) {
        self.timeline = timeline
        
        node = SKShapeNode(rectOf: size)
        node.fillColor = NSColor.gray
        node.position = position

    }
    
}
