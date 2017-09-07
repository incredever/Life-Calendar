import Cocoa
import SpriteKit

/// A VC that contains an NSView > SKView > SKScene hierarchy for displaying a human life in weeks.
class WeeksViewController: NSViewController {
    
    var skView: SKView!
    weak var window: NSWindow?
    var timeline: Timeline!
    var sidebarTableView: NSTableView!
    private let sidebarTableViewHandler = SidebarTableViewHandler()
    
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
        
        // Set up grid scene
        let scene = SKScene(size: skView.frame.size)
        scene.backgroundColor = NSColor(hexString: Color.sceneBackground.rawValue)
        scene.scaleMode = .aspectFill

        skView.presentScene(scene)
        skView.showsNodeCount = true
        skView.showsFPS = true
        
        window?.acceptsMouseMovedEvents = true
        window?.makeFirstResponder(scene)
        window?.setFrameAutosaveName(NSWindow.FrameAutosaveName(rawValue: "mainLifeCalendarWindow"))
        
        // Create Grid
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



