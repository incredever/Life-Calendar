//
//  SidebarView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/28/17.
//

import Cocoa

class SidebarView: NSView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        setup()
        
        print("SidebarView created.")
    }
    
    private func setup() {
        
        
//        [self setLocation:NSMakePoint(0.0,0.0)];
//        [self setItemColor:[NSColor redColor]];
//        [self setBackgroundColor:[NSColor whiteColor]];
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // tableview
    // table view cells
    
}
