import Cocoa

class SidebarTableViewHandler: NSObject, NSTableViewDelegate, NSTableViewDataSource {
    
    var timeline: Timeline!
    
    // MARK: DataSource stuff
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return timeline.events.count
    }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    // MARK: Delegate stuff
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let event = timeline.events[row]
        let eventDisplayView = EventDisplayView(event: event)
        
        return eventDisplayView
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let rowView = NSTableRowView(frame: NSRect.zero)
        
        return rowView
    }
    
}
