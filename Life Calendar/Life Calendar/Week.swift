//
//  Week.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/4/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct Week: Identifiable {
    
    let id: String = UUID().uuidString
    let start: Date
    var end: Date {
        return start.advanced(by: 604800) // one week from start
    }
    let defaultColor: Color = .gray
    
}
