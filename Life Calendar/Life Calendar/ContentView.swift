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
            
            Divider()
            
            List(events) { event in
                event.color
            }
            .background(Color.green)
            .frame(width: widthOfSidebar, height: nil, alignment: .center)
//            .background(Color(red: 243/255, green: 241/255, blue: 240/255))

        }
        .background(Color(red: 246/255, green: 244/255, blue: 241/255))

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
