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
        // Do view setup here.
        
        let scene = sceneView.scene!
        
        let theBox = scene.rootNode.childNode(withName: "theBox", recursively: true)!
        
        theBox.rotation = SCNVector4(x: 0, y: 0, z: 0, w: 50)
        
        
        
        
    }
    
}
