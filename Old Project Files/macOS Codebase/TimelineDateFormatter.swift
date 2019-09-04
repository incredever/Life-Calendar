import Foundation

class TimelineDateFormatter: DateFormatter {
    
    override init() {
        super.init()
        
        dateFormat = "yyyy-mm-dd"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
