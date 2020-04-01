import SwiftUI

struct ContentView: View {
    
    @State private var weeks: [Week] = {
        var weeks: [Week] = []
        var previousWeek = Week(start: Date())
        for i in 0...4500 {
            weeks.append(previousWeek)
            let newWeek = Week(start: previousWeek.end)
            previousWeek = newWeek
        }
        return weeks
    }()
    
    let events = [
        Event(id: UUID(), start: Date(), end: Date(), color: .blue, title: "Birth"),
        Event(id: UUID(), start: Date(), end: Date(), color: .red, title: "Death")
    ]
    
    private let widthOfSidebar = CGFloat(185)
    private let totalWidthOfWindow = CGFloat(658)
    private let totalHeightOfWindow = CGFloat(658)
    
    var body: some View {
        HStack {
            VStack {
                Text("Your Life")
                
                Grid(columns: 52, numItems: weeks.count, alignment: .center) { index, colWidth in
                    GridCell(width: colWidth)
                }
                .frame(width: 330, height: 568, alignment: .center)

            }
            .frame(width: totalWidthOfWindow - widthOfSidebar, height: totalHeightOfWindow, alignment: .center)
            
            Divider()
            
            Sidebar(events: events).frame(width: Sidebar.width, height: nil, alignment: .center)
        }
        .background(Color(red: 246/255, green: 244/255, blue: 241/255))

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
