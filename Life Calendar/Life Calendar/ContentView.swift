import SwiftUI

struct ContentView: View {
    
    let yourLife = Life()
    
    private let widthOfSidebar = CGFloat(185)
    private let totalWidthOfWindow = CGFloat(658)
    private let totalHeightOfWindow = CGFloat(658)
    
    var body: some View {
        HStack {
            VStack {
                Text("Your Life")
                
                Grid(columns: 52, numItems: yourLife.weeks.count, alignment: .center) { index, colWidth in
                    GridCell(width: colWidth)
                }
                .frame(width: 330, height: 568, alignment: .center)

            }
            .frame(width: totalWidthOfWindow - widthOfSidebar, height: totalHeightOfWindow, alignment: .center)
            
        }
        .background(Color(red: 246/255, green: 244/255, blue: 241/255))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
    
}
