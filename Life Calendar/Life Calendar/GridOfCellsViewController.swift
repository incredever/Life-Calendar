//
//  GridOfCellsViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/8/17.
//

import Cocoa
import SceneKit

class GridOfCellsViewController: NSViewController {

    @IBOutlet weak var sceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene()
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
        scene.rootNode.addChildNode(cameraNode)
        
        let box = SCNBox(width: 10, height: 10, length: 10, chamferRadius: 0)
        let node = SCNNode(geometry: box)
        
        scene.rootNode.addChildNode(node)
        
    }
    
}
