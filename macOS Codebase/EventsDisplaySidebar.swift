//
//  EventsDisplaySidebar.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/22/17.
//

import Foundation
import SpriteKit

class EventsDisplaySidebar {
    
    var timeline: Timeline {
        didSet {
            layoutEvents()
        }
    }
    
    var node: ScrollViewNode
    
    var size: CGSize {
        didSet {
            let rect = CGRect(x: position.x, y: position.y, width: size.width, height: size.height)
            
            node = ScrollViewNode(rect: rect)
        }
    }
    
    var position = CGPoint(x: 0, y: 0) {
        didSet {
            // SKShapeNode's are anchored at center. We want to set the position of the top left corner.
            let x = position.x + (size.width / 2)
            let y = position.y - (size.height / 2)

            node.position = CGPoint(x: x, y: y)
        }
    }
    
    private var eventDisplays: [EventDisplay] = []
    
    init(timeline: Timeline, size: CGSize) {
        self.timeline = timeline
        self.size = size
        
        node = ScrollViewNode(rectOf: size)
        let backgroundColor = NSColor(hexString: "EFEFEF")
        let borderColor = NSColor(hexString: "979797")
        node.fillColor = backgroundColor.withAlphaComponent(0.45)
        node.strokeColor = borderColor.withAlphaComponent(0.5)
        node.lineWidth = 0.5
        node.position = position
        node.isUserInteractionEnabled = true
        
        // Create testing EventDisplay
        let testEvent = Event(title: "Hello World", colorHex: "FFFFFF", span: DateInterval(start: Date(), end: Date()))
        let eventDisplay = EventDisplay(event: testEvent)
        node.addChild(eventDisplay.node)
        
        layoutEvents()
    }
    
    /// Goes through the events in `timeline` and creates an `EventDisplay` for each.
    private func layoutEvents() {
        var currentPosition = CGPoint(x: 0, y: 0)
        
        for event in timeline.events {
            let eventDisplay = EventDisplay(event: event)
            
            eventDisplay.position = currentPosition
            node.addChild(eventDisplay.node)
            
            // increase currentPosition
        }
    }
    
}
