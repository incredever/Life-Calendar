import Cocoa
import SpriteKit

/// An event that takes place over a duration of time.
class Event: Codable {
    
    var title: String
    var colorHex: String // TODO: Create encode-ability and make this property Color type
    let span: DateInterval
    let id: UUID = UUID()
    
    init(title: String, colorHex: String, span: DateInterval) {
        self.title = title
        self.colorHex = colorHex
        self.span = span
    }
    
}
