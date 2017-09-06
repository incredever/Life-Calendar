//
//  SidebarTableViewHandler.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/6/17.
//

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
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return nil
    }
    
    // MARK: Delegate stuff
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let event = timeline.events[row]
        let eventDisplayView = EventDisplayView(event: event)
        
        return eventDisplayView
    }
    
    func tableView(_ tableView: NSTableView, rowViewForRow row: Int) -> NSTableRowView? {
        let rowView = NSTableRowView(frame: NSRect.zero)
        
        //        rowView.interiorBackgroundStyle = NSView.BackgroundStyle.raised
        rowView.selectionHighlightStyle = .regular
        rowView.backgroundColor = .blue
        
        return rowView
    }
    
    func tableView(_ tableView: NSTableView, willDisplayCell cell: Any, for tableColumn: NSTableColumn?, row: Int) {
        if let eventDisplayView = cell as? EventDisplayView {
            print(eventDisplayView)
        }
    }
    
    //    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
    //        let v = tableView.view(atColumn: 0, row: row, makeIfNecessary: false) as? EventDisplayView
    //
    //        if let v = v {
    //            print(v.title.stringValue)
    //        }
    //
    //        return true
    //    }
    
    //    func tableViewSelectionDidChange(_ notification: Notification) {
    //
    //
    //    }

    
}


    

