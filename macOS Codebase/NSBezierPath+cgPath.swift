import Cocoa

extension NSBezierPath {
    
    var cgPath: CGPath {
        get {
            return self.transformToCGPath()
        }
    }
    
    /// Transforms the NSBezierPath into a CGPathRef
    ///
    /// :returns: The transformed NSBezierPath
    private func transformToCGPath() -> CGPath {
        // Create path
        let path = CGMutablePath()
        let points = UnsafeMutablePointer<NSPoint>.allocate(capacity: 3)
        let numElements = self.elementCount
        let cgPoint1 = CGPoint(x: points[0].x, y: points[0].y)
        let cgPoint2 = CGPoint(x: points[1].x, y: points[1].y)
        let cgPoint3 = CGPoint(x: points[2].x, y: points[2].y)
        
        if numElements > 0 {
            var didClosePath = true
            
            for index in 0..<numElements {
                let pathType = self.element(at: index, associatedPoints: points)
                
                switch pathType {
                case .moveToBezierPathElement :
                    path.move(to: cgPoint1)
                case .lineToBezierPathElement :
                    path.addLine(to: cgPoint1)
                    didClosePath = false
                case .curveToBezierPathElement :
                    path.addCurve(to: cgPoint1, control1: cgPoint2, control2: cgPoint3)
                    didClosePath = false
                case .closePathBezierPathElement:
                    path.closeSubpath()
                    didClosePath = true
                }
            }
            
            if !didClosePath {
                path.closeSubpath()
            }
        }
        
        points.deallocate(capacity: 3)
        
        return path
    }
    
}
