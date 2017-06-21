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
    }
    
    init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.init()
        
        node.position = SCNVector3(x: x, y: y, z: z)
    }
    
}
