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
        
        // http://ronnqvi.st/custom-scenekit-geometry/
//        
//        let cellGeometrySource = SCNGeometrySource(normals: [SCNVector3])
//        let cellGeometry = SCNGeometry(sources: [SCNGeometrySource], elements: nil)
//        let cell = SCNNode(geometry: <#T##SCNGeometry?#>)
//        
//        scene.rootNode.addChildNode(<#T##child: SCNNode##SCNNode#>)
        
        
    }
    
}
