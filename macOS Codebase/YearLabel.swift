//
//  YearLabel.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/7/17.
//

import Foundation
import SpriteKit

enum Fonts: String {
    case yearLabel = "Avenir Next"
}

struct YearLabel {
    
    var node: SKLabelNode!
    
    init(text: String, font: Fonts, color: Colors) {
        node = SKLabelNode()
    }
}
