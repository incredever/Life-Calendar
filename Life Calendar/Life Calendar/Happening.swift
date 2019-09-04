//
//  Happening.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/4/19.
//  Copyright © 2019 wes. All rights reserved.
//

import Foundation
import SwiftUI

struct Happening: Identifiable {
    
    let id: Int
    let start: Date
    let end: Date
    let color: Color
    let title: String
    
}
