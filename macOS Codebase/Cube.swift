//
//  Cube.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/16/17.
//

import SceneKit

class Cube {
    init() {
        let scene = SCNScene(named: "Cube.scn")
        let sceneTopLevelNode = scene?.rootNode.childNode(withName: "Cube", recursively: true)
        
        node = sceneTopLevelNode
    }
    
    convenience init(x: CGFloat, y: CGFloat, z: CGFloat) {
        self.init()
        
        node.position = SCNVector3(x: x, y: y, z: z)
    }
    
    var node: SCNNode!
}
