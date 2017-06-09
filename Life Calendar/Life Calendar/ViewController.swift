//
//  ViewController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 5/30/17.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var eventNameTextField: NSTextField!
    @IBOutlet weak var eventDateTextField: NSTextField!
    
    @IBAction func enterButton(_ sender: Any) {
        print(eventDateTextField.stringValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

