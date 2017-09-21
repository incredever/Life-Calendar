import Cocoa
import SpriteKit

/// A grid of tiles, each representing one week of a human life. In an MVC pattern, this would be a V.
class WeeksGrid {
    
    var delegate: EventEventsDelegate? = nil
    
    /// The date for the first tile in the grid.
    let start: Date
    
    /// The date for the last tile in the grid.
    let end: Date
    
    /// An SKNode for use in a SpriteKit scene.
    var node: WeeksGridNode

    /// An array of tiles spanning from the `start` date to `end` date. Each tile represents a one week.
    private var tiles: [WeekTile] = []
    
    private var staticYearLabels: [Label] = []
    
    /// The point at which the grid will position itself within its parent's coordinate system.
    var position = CGPoint(x: 0, y: 0) {
        didSet {
            node.position = position
        }
    }
    
    /// The size each square tile should be in points.
    private let tileSize = 4
    
    /// A private constant number of points to put between each tile.
    private let tilePadding = 2
    
    private var firstTileInSelection: WeekTile? = nil
    
    private let justTheYearDateFormatter: DateFormatter
    
    private let gutterWidthForYearLabels = 50
    
    /// The span of time between `start` and `end`.
    private var span: DateInterval {
        return DateInterval(start: start, end: end)
    }

    /// Creates a grid which shows tiles for every week between `start` and `end`.
    init(start: Date, end: Date, position: CGPoint, events: [Event]) {
        self.start = start
        self.end = end
        self.position = position
        self.tiles = []
        self.node = WeeksGridNode(position: position)
        self.justTheYearDateFormatter = DateFormatter()
        
        justTheYearDateFormatter.dateFormat = "yyyy"
        
        /// A span of seven days, incrementing by one week for every cycle in loops below.
        var currentSpan = DateInterval.oneWeek(startingFom: start)
        
        for yearNumber in 0...span.numberOfYearsWithin() {
            let y = (tileSize + tilePadding) * yearNumber * -1

            // Create the year label
            if yearNumber % 20 == 0 {
                let year = justTheYearDateFormatter.string(from: currentSpan.start)
                
                let label = Label(text: year, position: CGPoint(x: gutterWidthForYearLabels / 2, y: y))
                
                staticYearLabels.append(label)
            }
            
            // Create the row of tiles
            for weekNumber in 1...52 {
                let x = (tileSize + tilePadding) * weekNumber
                let tile = WeekTile(span: currentSpan)
                
                tile.position = CGPoint(x: x + gutterWidthForYearLabels, y: y)
                tile.size =  CGSize(width: tileSize, height: tileSize)
                tile.color = .blankTile
                
                tiles.append(tile)
                
                currentSpan = DateInterval.oneWeek(startingFom: currentSpan.end)
            }
        }
        
        node.owner = self
        
        for tile in tiles {
            node.addChild(tile.node)
        }
        
        for label in staticYearLabels {
            node.addChild(label.node)
        }
        
        
    }

    /// Returns an array of every tile which falls along the x axis.
    private func rowOfTiles(at point: CGPoint) -> [WeekTile] {
        return tiles.filter { point.y > ($0.position.y - $0.size.height) && point.y < $0.position.y }
    }
    
    /// Returns the tile as a point in the grid's coordinate system.
    private func tileAt(_ point: CGPoint) -> WeekTile? {
        return tiles.filter({ tile in
            let halfPadding = CGFloat(tilePadding) / 2.0
            let yRange = (tile.position.y - tile.size.height)-halfPadding...tile.position.y+halfPadding
            let xRange = tile.position.x-halfPadding...(tile.position.x + tile.size.width)+halfPadding

            return yRange.contains(point.y) && xRange.contains(point.x)
        }).first
    }
    
    /// Returns an array of tiles that fall between the `firstTile`'s start date and the `secondTile`'s end date. `firstTile` may come before or after `secondTile` - it will return the tiles within the range, regardless of order.
    private func tilesBetween(firstTile: WeekTile, secondTile: WeekTile) -> [WeekTile] {
        let start = firstTile.span.start
        let end = secondTile.span.end
        
        if start < end {
            return tiles.filter { $0.span.start >= start && $0.span.end <= end }
        } else {
            return tiles.filter { $0.span.start <= start && $0.span.end >= end }
        }
    }
    
    /// Handles mouse down events passed from some NSResponder subclass - usually GridNode.
    func mouseDown(at point: CGPoint) {
        if let tile = tileAt(point) {
            firstTileInSelection = tile
        }
    }

    /// Handles mouse dragging events passed from some NSResponder subclass - usually GridNode.
    func mouseDragged(at point: CGPoint) {
        if let currentTile = tileAt(point) {
            createYearLabel(for: currentTile)
            createDateLabel(for: currentTile)
            selectUpTo(tile: currentTile)
        }
    }

    /// Handles mouse up events passed from some NSResponder subclass - usually GridNode.
    func mouseUp(at point: CGPoint) {
        if let currentTile = tileAt(point) {
            selectUpTo(tile: currentTile)
            
            if let startingTile = firstTileInSelection {
                let _ = tilesBetween(firstTile: startingTile, secondTile: currentTile).map { $0.color = .red }
                
                delegate?.new(event: Event(title: "new event", colorHex: "FFFFFF", span: currentTile.span))
            }
        }
        
        firstTileInSelection = nil
    }
    
    /// Handles mouse move events passed from some NSResponder subclass - usually GridNode.
    func mouseMoved(at point: CGPoint) {
        if let currentTile = tileAt(point) {
            createYearLabel(for: currentTile)
            createDateLabel(for: currentTile)
            selectUpTo(tile: currentTile)
        } else {
            node.childNode(withName: "HoverYearLabel")?.removeFromParent()
            node.childNode(withName: "HoverDateLabel")?.removeFromParent()
        }
    }
    
    func createYearLabel(for tile: WeekTile) {
        node.childNode(withName: "HoverYearLabel")?.removeFromParent()
        
        let year = justTheYearDateFormatter.string(from: tile.span.start)
        let label = Label(text: year, position: CGPoint(x: CGFloat(gutterWidthForYearLabels / 2), y: tile.position.y))
        
        label.fontColor = .red
        label.node.name = "HoverYearLabel"
        
        node.addChild(label.node)
    }
    
    func createDateLabel(for tile: WeekTile) {
        node.childNode(withName: "HoverDateLabel")?.removeFromParent()
        
        let simpleMonthAndDaysDateFormatter = DateFormatter()
        simpleMonthAndDaysDateFormatter.dateFormat = "M/d"
        
        let startDate = simpleMonthAndDaysDateFormatter.string(from: tile.span.start)
        let endDate = simpleMonthAndDaysDateFormatter.string(from: tile.span.end)
        let label = Label(text: "\(startDate)–\(endDate)", position: CGPoint(x: tile.position.x , y: 10))
        
        label.fontColor = .red
        label.fontSize = 12.0
        label.node.name = "HoverDateLabel"
        
        node.addChild(label.node)
    }
    
    func selectUpTo(tile: WeekTile) {
        if let startingTile = firstTileInSelection {
            let _ = tilesBetween(firstTile: startingTile, secondTile: tile).map { $0.color = .red }
        }
    }
    
}
