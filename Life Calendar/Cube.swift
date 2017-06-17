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
        let sceneTopLevelNode = scene?.rootNode.childNodes[0]
        
        node = sceneTopLevelNode
    }
    
    var node: SCNNode!
}
