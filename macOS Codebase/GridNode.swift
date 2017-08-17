//
//  GridNode.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/17/17.
//

import Foundation
import SpriteKit

class GridNode: SKNode {
    
    var owner: Grid? = nil
    
    override func mouseDown(with event: NSEvent) {
        guard let owner = owner else {
            print("No owner for GridNode found.")
            return
        }
        
       owner.click(at: event.location(in: self))
        
    }
    
}
