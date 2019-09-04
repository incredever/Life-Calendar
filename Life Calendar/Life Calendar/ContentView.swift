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
