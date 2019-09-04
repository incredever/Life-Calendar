//
//  Week.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/4/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct Week {
    
    let start: Date
    var end: Date {
        // Generate one week from now
        return Date()
    }
    let defaultColor: Color = .gray
    
}
