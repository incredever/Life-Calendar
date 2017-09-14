import Cocoa
import SpriteKit

/// The atomic entity of the timeline data structure: representing an event that takes place over a duration of time.
struct Event: Codable {
    
    var title: String
    var colorHex: String // TODO: Create encode-ability and make this property Color type
    let span: DateInterval
    
}
