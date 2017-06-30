//
//  EventEntryViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/30/17.
//

import Cocoa

class EventEntryViewController: NSViewController {

    @IBOutlet weak var titleField: NSTextField!
    @IBOutlet weak var startDatePicker: NSDatePicker!
    @IBOutlet weak var endDatePicker: NSDatePicker!
    
    @IBAction func addToTimeline(_ sender: NSButton) {
        guard titleField.stringValue != "" else {
            print("no title")
            return
        }
        
        let title = titleField.stringValue
        let startDate = startDatePicker.dateValue
        let endDate = endDatePicker.dateValue
        
        let newEvent = Event(title: title, starting: startDate, ending: endDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
