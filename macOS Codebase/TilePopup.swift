//
//  TilePopup.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/29/17.
//

import Cocoa
import SpriteKit

struct TilePopup {
    
    let node: SKNode!
    
    init() {
        node = SKNode()
        
//        // Create background
//        let background = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 20, height: 10))
//        background.fillColor = NSColor.lightGray
//        node.addChild(background)
//
//        node.position = CGPoint(x: -10, y: 5)
        
        // Create label
        let label = SKLabelNode(fontNamed: "Avenir Next")
        label.text = "Hello"
        label.fontColor = NSColor.red
        label.fontSize = 14
        label.position = CGPoint(x: -10, y: 5)
        
        node.addChild(label)
        
        // Create background
        let strokeColor = NSColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        
        //// Bezier 5 Drawing
        let bezier5Path = NSBezierPath()
        bezier5Path.move(to: NSPoint(x: 122, y: 70))
        bezier5Path.curve(to: NSPoint(x: 124.99, y: 73), controlPoint1: NSPoint(x: 122, y: 71.66), controlPoint2: NSPoint(x: 123.35, y: 73))
        bezier5Path.line(to: NSPoint(x: 181.01, y: 73))
        bezier5Path.curve(to: NSPoint(x: 184, y: 70), controlPoint1: NSPoint(x: 182.66, y: 73), controlPoint2: NSPoint(x: 184, y: 71.65))
        bezier5Path.line(to: NSPoint(x: 184, y: 57.05))
        bezier5Path.curve(to: NSPoint(x: 181, y: 54.05), controlPoint1: NSPoint(x: 184, y: 55.4), controlPoint2: NSPoint(x: 182.66, y: 54.05))
        bezier5Path.line(to: NSPoint(x: 162.01, y: 54.05))
        bezier5Path.curve(to: NSPoint(x: 156.53, y: 52.38), controlPoint1: NSPoint(x: 160.36, y: 54.05), controlPoint2: NSPoint(x: 157.9, y: 53.3))
        bezier5Path.line(to: NSPoint(x: 155.48, y: 51.67))
        bezier5Path.curve(to: NSPoint(x: 150.54, y: 51.73), controlPoint1: NSPoint(x: 154.11, y: 50.75), controlPoint2: NSPoint(x: 151.9, y: 50.77))
        bezier5Path.line(to: NSPoint(x: 149.7, y: 52.32))
        bezier5Path.curve(to: NSPoint(x: 144.25, y: 54.05), controlPoint1: NSPoint(x: 148.34, y: 53.28), controlPoint2: NSPoint(x: 145.9, y: 54.05))
        bezier5Path.line(to: NSPoint(x: 124.99, y: 54.05))
        bezier5Path.curve(to: NSPoint(x: 122, y: 57.05), controlPoint1: NSPoint(x: 123.34, y: 54.05), controlPoint2: NSPoint(x: 122, y: 55.4))
        bezier5Path.line(to: NSPoint(x: 122, y: 70))
        bezier5Path.close()
        strokeColor.setStroke()
        bezier5Path.lineWidth = 0.5
        bezier5Path.stroke()
        
        

    }
    
}
