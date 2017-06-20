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
        
        sceneView.gestureRecognizers = [NSClickGestureRecognizer(target: self, action: #selector(sceneClicked))]
        
        let numberOfRows = 10
        let numberOfColumns = 10
        let rowHeight = CGFloat(1)
        let columnHeight = CGFloat(1)
        let padding = CGFloat(0.5)
        
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
