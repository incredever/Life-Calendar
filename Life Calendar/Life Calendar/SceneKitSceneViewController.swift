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
        
        
        
        
    }
    
}
