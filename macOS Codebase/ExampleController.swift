//
//  ExampleController.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 6/23/17.
//

import Cocoa

class ExampleController: NSViewController {

    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var testField: NSTextField!
    var number = 0
    
    @IBAction func sliderUpdated(_ sender: NSSlider) {
        number = sender.integerValue
        testField.takeIntValueFrom(sender)
    }
    
}
