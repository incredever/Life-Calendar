import Foundation

protocol TimeSpan {
    
    var start: Date { get }
    var end: Date { get }
    
    func isDuring(_ span: TimeSpan) -> Bool
    
}

extension TimeSpan {
    
    func isDuring(_ otherSpan: TimeSpan) -> Bool {
        let startsDuring = start > otherSpan.start && start < otherSpan.end
        let endsDuring = end > otherSpan.start && end < otherSpan.end
        let contains = start < otherSpan.start && end > otherSpan.end
        
        return (startsDuring || endsDuring || contains)
    }
    
}
