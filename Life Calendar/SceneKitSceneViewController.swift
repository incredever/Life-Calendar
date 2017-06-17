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
        
        let theBox = scene.rootNode.childNode(withName: "theBox", recursively: true)!
        
        let codeBox = SCNNode(geometry: theBox.geometry)
        
        scene.rootNode.addChildNode(codeBox)
        
        let startingPoint = scene.rootNode.childNode(withName: "StartingPoint", recursively: true)
        let cube = Cube()
        
        let numberOfRows = 10
        let numberOfColumns = 10
        for row in 0...numberOfRows {
            for column in 0...numberOfColumns {
//                createCell(x: row * rowHight, y: column * columnHight)
                print("row: \(row), column: \(column)")
            }
        }
        
        cube.node.transform = startingPoint!.transform
        
        scene.rootNode.addChildNode(cube.node)
    }
    
}
