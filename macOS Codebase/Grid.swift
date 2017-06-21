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
        
        drawGridOfCubes(rows: 4, columns: 3)
    }
    
    init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.init()
        
        node.position = SCNVector3(x: x, y: y, z: z)
    }
    
    private func drawGridOfCubes(rows: Int, columns: Int) {
        let numberOfRows = rows
        let numberOfColumns = columns
        let rowHeight = CGFloat(1)
        let columnHeight = CGFloat(1)
        let padding = CGFloat(0.5)
        
        for row in 0...numberOfRows {
            for column in 0...numberOfColumns {
                let rowNumberAsCGFloat = CGFloat(row)
                let columnNumberAsCGFloat = CGFloat(column)
                
                let x = (rowNumberAsCGFloat * rowHeight) + (rowNumberAsCGFloat * padding)
                let y = (columnNumberAsCGFloat * columnHeight) + (columnNumberAsCGFloat * padding)
                let cube = Cube(x: x, y: y, z: 0)
                
                node.addChildNode(cube.node)
            }
        }
    }
    
}
