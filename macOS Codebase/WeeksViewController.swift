import Cocoa
import SpriteKit

/// A view controller for the viewing and editing of a timeline document representing a human life in weeks.
class WeeksViewController: NSViewController {
    
    /// A reference to the window which displays this view controller.
    weak var window: NSWindow?

    /// A SpriteKit view which will display the scene which renders the grid of tiles.
    private var skView: SKView!
    
    /// An implicitly unwrapped reference to the timeline object which is the primary model of this view controller.
    private var timeline: Timeline!
    
    /// An implicitly unwrapped reference to the table view which displays the events in the sidebar.
    private var sidebarTableView: NSTableView!
    
    /// A reference to the handler object which provides the `sidebarTableView` with it's data source and handles it's delegation.
    private let sidebarTableViewHandler = EventsTableViewHandler()
    
    override func loadView() {
        let windowSize = window?.frame.size ?? CGSize(width: 0, height: 0)
        
        view = NSView(frame: NSRect(x: 0, y: 0, width: windowSize.width, height: windowSize.height + 22))
        skView = SKView(frame: NSRect(x: 0, y: 0, width: windowSize.width, height: windowSize.height))
        
        view.addSubview(skView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up testing timeline
        let span = DateInterval(start: Date(), end: Date())
        let exampleEvent1 = Event(title: "Hello World", colorHex: "000000", span: span)
//        let exampleEvent2 = Event(title: "Test Event", colorHex: "FFFFFF", span: span)
//        let exampleEvent3 = Event(title: "Blah blah blah", colorHex: "FFFFFF", span: span)

        timeline = Timeline(events: [exampleEvent1], name: "Testing timeline ABC 1234")
        
        timeline.saveToDisk()
        
        sidebarTableViewHandler.timeline = timeline
        
        createGrid()
        createSidebar()
    }
    
    /// Called from viewDidLoad.
    private func createGrid() {
        // First set up the SpriteKit scene
        let scene = SKScene(size: skView.frame.size)
        scene.backgroundColor = NSColor(hexString: Color.sceneBackground.rawValue)
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        skView.showsNodeCount = true
        skView.showsFPS = true
        
        window?.acceptsMouseMovedEvents = true
        window?.makeFirstResponder(scene)
        window?.setFrameAutosaveName(NSWindow.FrameAutosaveName(rawValue: "mainLifeCalendarWindow"))
        
        // Now create the grid
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        let myBirth = dateFormatter.date(from: "1993-01-05")!
        let possibleDeath = dateFormatter.date(from: "2083-01-04")!
        let size = CGSize(width: 330, height: 574)
        let gridPosition = CGPoint(x: 20, y: Int(size.height) - 10)
        
        let grid = WeeksGrid(start: myBirth, end: possibleDeath, position: gridPosition)
        
        grid.delegate = self
        grid.timeline = timeline
        
        scene.addChild(grid.node)
    }
    
    /// Called from viewDidLoad.
    private func createSidebar() {
        // Create the table view
        let widthOfSidebar = CGFloat(150)
        let tableContainer = NSScrollView(frame: NSRect(x: view.frame.width - widthOfSidebar,
                                                        y: 0,
                                                        width: widthOfSidebar,
                                                        height: view.frame.height))
        
        sidebarTableView = NSTableView(frame: NSRect(origin: CGPoint(x: 0, y: 0),
                                                     size: tableContainer.frame.size))
        
        let column1 = NSTableColumn(identifier: NSUserInterfaceItemIdentifier.init(rawValue: "Column1"))
        column1.width = widthOfSidebar
        
        sidebarTableView.addTableColumn(column1)
        sidebarTableView.dataSource = sidebarTableViewHandler
        sidebarTableView.delegate = sidebarTableViewHandler
        sidebarTableView.reloadData()
        sidebarTableView.backgroundColor = NSColor(hexString: "F3F1F0")
        sidebarTableView.headerView = nil
        
        tableContainer.documentView = sidebarTableView
        tableContainer.hasVerticalScroller = true
        
        view.addSubview(tableContainer)
        
        // Add boarder to left side of sidebar
        let boarderRect = NSRect(x: view.frame.width - widthOfSidebar, y: 0, width: 0.5, height: view.frame.height)
        let sidebarBoarderLine = NSBox(frame: boarderRect)
        sidebarBoarderLine.boxType = .custom
        sidebarBoarderLine.borderType = .noBorder
        sidebarBoarderLine.fillColor = .lightGray
        view.addSubview(sidebarBoarderLine)
    }
    
}

extension WeeksViewController: GridBasedEventCreationDelegate {
    
    func eventCreated(spanning: DateInterval) {
        let newEvent = Event(title: "testing 123", colorHex: "FFFFFF", span: spanning)
        
        timeline.events.append(newEvent)
        
        sidebarTableView.reloadData()
    }
    
}



