//
//  ContentView.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 9/3/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Text("A Lifetime")
            Timeline()
        }
        .background(Color(red: 246/255, green: 244/255, blue: 241/255))
        .frame(width: 658, height: 658, alignment: .center)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
