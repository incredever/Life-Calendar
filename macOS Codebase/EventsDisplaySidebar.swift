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
    
    private var eventDisplays: [EventDisplay] = []
    
    init(timeline: Timeline) {
        self.timeline = timeline
        
        node = SKShapeNode(rectOf: CGSize(width: 100, height: 500))
        node.fillColor = NSColor.gray

    }
    
}
