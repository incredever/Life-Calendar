import SwiftUI

struct ContentView: View {
    
    let events = [
        Event(id: 0, start: Date(), end: Date(), color: .blue, title: "Birth")
    ]
    
    
    private let widthOfSidebar = CGFloat(185)
    private let totalWidthOfWindow = CGFloat(658)
    private let totalHeightOfWindow = CGFloat(658)
    
    
    var body: some View {
        HStack {
            
            
            VStack {
                Text("The Life of John Doe")
                Timeline()
            }
            .frame(width: totalWidthOfWindow - widthOfSidebar, height: totalHeightOfWindow, alignment: .center)
            .background(Color(red: 246/255, green: 244/255, blue: 241/255))
            
            List(events) { event in
                event.color
            }
            .frame(width: widthOfSidebar, height: nil, alignment: .center)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
