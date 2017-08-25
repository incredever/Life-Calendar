//
//  Line.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/25/17.
//

import Foundation
import SpriteKit

class Line {
    
    /// The point at which one end of the line falls within it's parents coordinate system.
    var start: CGPoint
    
    /// The point at which one end of the line falls within it's parents coordinate system.
    var end: CGPoint
    
    /// The stroke width the line should be drawn width.
    var thickness: Double {
        didSet {
            node.lineWidth = CGFloat(thickness)
        }
    }
    
    /// The color the line should be drawn with.
    var color: Color
    
    /// An SpriteKit node for use in a SpriteKit scene.
    var node: SKShapeNode
    
    /// Creates an instance which draws a line from starting point to ending point.
    init(starting: CGPoint, ending: CGPoint) {
        start = starting
        end = ending
        
        thickness = 2.0
        color = .line
        
        var points = [starting, ending]
        node = SKShapeNode(points: &points, count: points.count)
        node.strokeColor = NSColor(hexString: color.rawValue)
        node.lineWidth = CGFloat(thickness)
    }
    
}
