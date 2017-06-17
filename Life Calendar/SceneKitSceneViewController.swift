//
//  SceneKitSceneViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/10/17.
//

import Cocoa
import SceneKit

class SceneKitSceneViewController: NSViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = sceneView.scene!
        
        // Use the starting point node as the begining location for the top left cube
//        let startingPoint = scene.rootNode.childNode(withName: "StartingPoint", recursively: true)
//        cube.node.transform = startingPoint!.transform
        
        let numberOfRows = 10
        let numberOfColumns = 10
        let rowHeight = 1
        let columnHeight = 1
        let padding = CGFloat(0.5)
        
        for row in 0...numberOfRows {
            for column in 0...numberOfColumns {
                let x = CGFloat(row * rowHeight) + padding
                let y = CGFloat(column * columnHeight) + padding
                let cube = Cube(x: x, y: y, z: 0)
                
                scene.rootNode.addChildNode(cube.node)
            }
        }
    }
    
}
