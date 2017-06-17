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
        let rowHeight = CGFloat(1)
        let columnHeight = CGFloat(1)
        let padding = CGFloat(0.1)
        
        for row in 0...numberOfRows {
            for column in 0...numberOfColumns {
                let rowNumberAsCGFloat = CGFloat(row)
                let columnNumberAsCGFloat = CGFloat(column)
                
                let x = (rowNumberAsCGFloat * rowHeight) + (rowNumberAsCGFloat * padding)
                let y = (columnNumberAsCGFloat * columnHeight) + (columnNumberAsCGFloat * padding)
                let cube = Cube(x: x, y: y, z: 0)
                
                scene.rootNode.addChildNode(cube.node)
            }
        }
    }
    
}
