//
//  TimelineDateFormatter.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 8/24/17.
//

import Foundation

class TimelineDateFormatter: DateFormatter {
    
    override init() {
        super.init()
        
        dateFormat = "yyyy-mm-dd"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
