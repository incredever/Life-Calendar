//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/20/17.
//

import Cocoa
import SceneKit

class Grid {
    
    var node: SCNNode!
    
    init() {
        node = SCNNode()
    }
    
    convenience init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.init()
        
        node.position = SCNVector3(x: x, y: y, z: z)
    }
    
}
