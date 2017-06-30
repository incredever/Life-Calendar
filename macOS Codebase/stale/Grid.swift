//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/20/17.
//

import Cocoa
import SceneKit

struct Grid {
    
    var node: SCNNode!
    
    init() {
        node = SCNNode()
        
        drawGridOfCubes(rows: 7, columns: 30)
    }
    
    init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.init()
        
        node.position = SCNVector3(x: x, y: y, z: z)
    }
    
    private func drawGridOfCubes(rows: Int, columns: Int) {
        let rowHeight = CGFloat(1)
        let columnHeight = CGFloat(1)
        let padding = CGFloat(0.5)
        
        for column in 0...columns {
            for row in 0...rows {
                let y = (CGFloat(row) * rowHeight) + (CGFloat(row) * padding)
                let x = (CGFloat(column) * columnHeight) + (CGFloat(column) * padding)
                let cube = Cube(x: x, y: y, z: 0)
                
                node.addChildNode(cube.node)
            }
        }
    }
    
}
