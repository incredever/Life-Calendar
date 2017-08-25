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
    var thickness: Double
    
    /// The color the line should be drawn with.
    var color: Color
    
    /// An SpriteKit node for use in a SpriteKit scene.
    var node: SKShapeNode
    
    /// Creates an instance which draws a line from starting point to ending point.
    init(starting: CGPoint, ending: CGPoint) {
        start = starting
        end = ending
        
        thickness = 2.0
        color = .black
        
//        node = SKShapeNode(circleOfRadius: 40)
//        node.fillColor = .blue
        
//        var points = [CGPoint(x: 10, y: 10), CGPoint(x: 20, y: 20)]
//        node = SKShapeNode(points: &points, count: 1)
//        node.strokeColor = .black
//        node.lineWidth = 10.0
        
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        var path = CGPath(rect: rect, transform: nil)
//        let path2 = UIBezierPath()
//        path2.move(to: starting)
//        path2.line(to: ending)
        
        node = SKShapeNode(path: path)
        node.strokeColor = .black
        node.lineWidth = 5.0
    }
    
}
