//
//  ViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/24/17.
//

import Cocoa

class ViewController : NSViewController {
    override func loadView() {
        let view = NSView(frame: NSMakeRect(0,0,100,100))
        view.wantsLayer = true
        view.layer?.borderWidth = 2
        view.layer?.borderColor = NSColor.red.cgColor
        self.view = view
    }
}
