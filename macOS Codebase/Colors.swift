//
//  Colors.swift
//  Life Calendar
//
//  Created by Wesley Van der Klomp on 7/25/17.
//

import Cocoa

// TODO: Rewrite this to be cleaner.
extension NSColor {
    convenience init(hexString:String) {
        
        let scanner = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color:UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        
        return NSString(format:"#%06x", rgb) as String
    }
}

//extension NSColor {
//    static func fromHex(string: String) -> NSColor? {
//        return nil
//    }
//
//    convenience from(hex6: Int, alpha: Float) {
//        self.init(red:   CGFloat( (hex6 & 0xFF0000) >> 16 ) / 255.0,
//                  green: CGFloat( (hex6 & 0x00FF00) >> 8 ) / 255.0,
//                  blue:  CGFloat( (hex6 & 0x0000FF) >> 0 ) / 255.0, alpha: CGFloat(alpha))
//    }
//
//
//}
//
//enum Colors: String {
//
//    case sceneBackground: "F6F4F1"
//}

