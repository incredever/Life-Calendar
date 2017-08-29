//
//  EventDisplay.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/22/17.
//

import Foundation
import SpriteKit

class EventDisplay {
    
    var node: EventDisplayNode!
    var view: EventDisplayView!
    
    let event: Event
    
    var position = CGPoint(x: 0, y: 0) {
        didSet {
            node.position = position
        }
    }
    
    var size = CGSize(width: 150, height: 75) {
        didSet {
            setupNode()
        }
    }
    
    init(event: Event) {
        self.event = event
        
        setupNode()
        setupView()
    }
    
    private func setupView() {
        let mainView = EventDisplayView(frame: NSRect(origin: position, size: size))

        view = mainView
    }
    
    private func setupNode() {
        node = EventDisplayNode(size: size, owner: self)
        
        node.strokeColor = .clear
        node.position = position
        
        let topLeftPoint = CGPoint(x: -(size.width / 2), y: size.height / 2)
        let testShape = SKShapeNode(circleOfRadius: 3)
        testShape.fillColor = .red
        testShape.position = topLeftPoint
        node.addChild(testShape)
        
        let testCenterShape = SKShapeNode(circleOfRadius: 3)
        testCenterShape.fillColor = .red
        testCenterShape.position = CGPoint.zero
        node.addChild(testCenterShape)
        
        let titleLabel = Label(text: event.title)
        titleLabel.fontSize = 12
        titleLabel.position = CGPoint(x: topLeftPoint.x + (titleLabel.width / 2) + 5,
                                      y: topLeftPoint.y - (titleLabel.height / 2) - 15)
        
        node.addChild(titleLabel.node)
        
        let formatter = TimelineDateFormatter()
        let start = formatter.string(from: event.span.start)
        let end = formatter.string(from: event.span.end)
        let dateLabel = Label(text: "\(start) ┄ \(end)")
        
        dateLabel.fontSize = 10
        dateLabel.position = CGPoint(x: -(size.width / 2) + (dateLabel.width / 2) + 5,
                                     y: (size.height / 2) - (dateLabel.height / 2) - 20 - titleLabel.height)
        
        node.addChild(dateLabel.node)
        
        // Create the top bar line
        let topY = node.frame.height/2
        let leftX = (node.frame.width / 2) * -1
        let rightX = (node.frame.width / 2)
        let line = Line(starting: CGPoint(x: leftX, y: topY), ending: CGPoint(x: rightX, y: topY))
        line.thickness = 0.25
        node.addChild(line.node)
    }
    
}
