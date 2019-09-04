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
            Text("The Life of John Doe")
            Timeline()
        }
        .frame(width: 658, height: 658, alignment: .center)
        .background(Color(red: 246/255, green: 244/255, blue: 241/255))

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
