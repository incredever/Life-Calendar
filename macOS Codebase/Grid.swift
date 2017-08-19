//
//  Grid.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/27/17.
//

import Cocoa
import SpriteKit

/// A grid of tiles, each representing one week of a human life.
struct Grid {
    
    /// The date for the first tile in the grid.
    let start: Date
    
    /// The date for the last tile in the grid.
    let end: Date
    
    /// An SKNode for use in a SpriteKit scene.
    var node: GridNode

    /// An array of tiles spanning from the `start` date to `end` date. Each tile represents a one week.
    var tiles: [Tile]
    
    /// The dimensions at which the grid will be generated.
    let size: CGSize
    
    /// The point at which the grid will position itself within its parent's coordinate system.
    var position: CGPoint {
        didSet {
            node.position = position
        }
    }
    
    /// The size each square tile should be in points.
    private let tileSize = 4
    
    /// The number of points to put between each tile.
    private let tilePadding = 2
    
    /// The span of time between `start` and `end`.
    private var span: DateInterval {
        return DateInterval(start: start, end: end)
    }
    
    /// Creates a grid which shows tiles for every week between `start` and `end`.
    init(start: Date, end: Date, size: CGSize, position: CGPoint) {
        self.start = start
        self.end = end
        self.size = size
        self.position = position
        self.tiles = []
        self.node = GridNode()
        
        /// A span of seven days, incrementing by one week for every cycle in loops below.
        var currentSpan = DateInterval.oneWeek(startingFom: start)
        
        for yearNumber in 0...span.numberOfYearsWithin() {
            for weekNumber in 1...52 {
                let y = (tileSize + tilePadding) * yearNumber * -1
                let x = (tileSize + tilePadding) * weekNumber
                let tile = Tile(span: currentSpan)
                
                tile.position = CGPoint(x: x, y: y)
                tile.size =  CGSize(width: tileSize, height: tileSize)
                tile.color = Color.red
                
                tiles.append(tile)
                
                currentSpan = DateInterval.oneWeek(startingFom: currentSpan.end)
            }
        }
        
        node.position = position
        node.isUserInteractionEnabled = true
        node.owner = self
        
        for tile in tiles {
            node.addChild(tile.node)
        }
    }

    private func rowOfTiles(at point: CGPoint) -> [Tile] {
        return tiles.filter { point.y > ($0.position.y - $0.size.height) && point.y < $0.position.y }
    }
    
    private func tileAt(_ point: CGPoint) -> Tile? {
        return tiles.filter({ tile in
            let yRange = (tile.position.y - tile.size.height)...tile.position.y
            let xRange = tile.position.x...(tile.position.x + tile.size.width)

            return yRange.contains(point.y) && xRange.contains(point.x)
        }).first
    }
    
    /// Returns an array of tiles that fall between the `firstTile`'s start date and the `secondTile`'s end date.
    private func tilesBetween(firstTile: Tile, secondTile: Tile) -> [Tile] {
        let start = firstTile.span.start
        let end = secondTile.span.end
        
        return tiles.filter { tileFromArray in
            if tileFromArray.span.start >= start && tileFromArray.span.end <= end {
                return true
            } else {
                return false
            }
        }
    }

    // MARK: Interaction handling
    
    private var firstTileInSelection: Tile? = nil

    mutating func mouseDown(at point: CGPoint) {
        if let tile = tileAt(point) {
            firstTileInSelection = tile

            tile.color = .blue
        }
    }

    func mouseDragged(at point: CGPoint) {
        let tile = tileAt(point)

        if let tile = tile {
            tile.color = .green
        }
    }

    mutating func mouseUp(at point: CGPoint) {
        if let currentTile = tileAt(point) {
            if let startingTile = firstTileInSelection {
                let _ = tilesBetween(firstTile: startingTile, secondTile: currentTile).map { $0.color = .blankTile }
            }

            currentTile.color = .blue
        }
        
        firstTileInSelection = nil
    }
    
}
