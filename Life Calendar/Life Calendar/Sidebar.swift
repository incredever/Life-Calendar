import SwiftUI

struct Sidebar: View {
    
    var events: [Event]
    
    static let width = CGFloat(185)
    
    var body: some View {
        
        List(events) { event in
            event.color
        }
        .background(Color.green)
        .frame(width: Sidebar.width, height: nil, alignment: .center)

        
    }
    
}
