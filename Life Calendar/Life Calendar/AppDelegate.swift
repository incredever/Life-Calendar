import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: ContentView())
        window.titlebarAppearsTransparent = true
        window.isMovableByWindowBackground = false
        window.titleVisibility = .visible
        window.backgroundColor = NSColor(deviceRed: 246/255, green: 244/255, blue: 241/255, alpha: 1.0)
        
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

