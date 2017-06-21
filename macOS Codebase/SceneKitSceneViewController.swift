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
    var scene: SCNScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.allowsCameraControl = true
        sceneView.gestureRecognizers = [NSClickGestureRecognizer(target: self, action: #selector(sceneClicked))]
        scene = sceneView.scene!
        
        let grid = Grid()
        scene.rootNode.addChildNode(grid.node)
    }
    
    override func viewDidAppear() {
        view.window?.title = "Life Calendar"
    }
    
    @objc func sceneClicked(gestureRecognizer: NSGestureRecognizer) {
        print("click detected")
        
        let location = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(location, options: nil)
        
        if hitResults.count > 0 {
            let result = hitResults[0]
            let node = result.node
            node.removeFromParentNode()
        }
    }
    
}
