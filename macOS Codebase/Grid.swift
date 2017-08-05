//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

class Grid: NSResponder {
    
    let ultimateSize = CGSize(width: 330, height: 574)
    let node: SKNode!
    let startDate = birth!
    let endDate = death!
    
    override init() {
        node = SKNode()

        super.init()
        
//        generateGridOfTiles(rows: 90, columns: 52)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func generateGridOfTiles(rows: Int, columns: Int) {
        let padding = 2
        let tileSize = 4
        var currentSpan = next7Days(from: Date())

        for rowNumber in 0...rows {
            for columnNumber in 0...columns {
                let x = (tileSize + padding) * columnNumber
                let y = (tileSize + padding) * rowNumber * -1
                
                addTile(at: CGPoint(x: x, y: y), span: currentSpan)
                
                currentSpan = next7Days(from: currentSpan.end)
            }
        }
    }
    
    private func next7Days(from: Date) -> DateInterval {
        return DateInterval(start: from, duration: 604800)
    }
    
    private func addTile(at position: CGPoint, span: DateInterval) {
        let tile = Tile()
        
        tile.node.position = position
        
//        let trackingArea = NSTrackingArea(rect: tile.node.frame, options: [NSTrackingArea.Options.activeInKeyWindow, NSTrackingArea.Options.mouseMoved], owner: self, userInfo: nil)
//
//        if let scene = node.scene {
//            if let view = scene.view {
//                view.addTrackingArea(trackingArea)
//            }
//        }
        
        node.addChild(tile.node)
    }
    
    override func mouseMoved(with theEvent: NSEvent) {
        let location = theEvent.location(in: self.node)
        
        print(location)
    }
    
}
