//
//  Cell.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/3/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct Cell: View {
    
    let width: CGFloat
    
    var body: some View {
        Color(red: 148/255, green: 148/255, blue: 148/255)
        .opacity(0.3)
        .frame(width: width - 2.4, height: 4, alignment: .center)
        .padding(.top, 2.4)
    }
    
}
