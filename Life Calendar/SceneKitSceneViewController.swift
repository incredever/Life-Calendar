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
        
        let cube = Cube()
        
        let numberOfRows = 10
        let numberOfColumns = 10
        for row in 0...numberOfRows {
            for column in 0...numberOfColumns {
//                createCell(x: row * rowHight, y: column * columnHight)
                print("row: \(row), column: \(column)")
            }
        }
        
        scene.rootNode.addChildNode(cube.node)
    }
    
}
