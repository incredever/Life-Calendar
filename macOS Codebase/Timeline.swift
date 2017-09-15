import Cocoa

class Timeline: Codable {
    var events: [Event]
    let name: String
    
    init(events: [Event], name: String) {
        self.events = events
        self.name = name
    }
    
    func saveToDisk() {
        let encoder = JSONEncoder()
        let json = try? encoder.encode(self)
        let dir = "/Users/wes/Documents/Life Calendar/"
        
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
        FileManager.default.createFile(atPath: "\(dir)\(name).txt", contents: json, attributes: nil)
    }
    
    /// Returns the event, if any, whith has the same UUID.
    func event(for id: UUID) -> Event? {
        for event in events {
            if event.id == id {
                return event
            }
        }
        
        return nil
    }
    
}
