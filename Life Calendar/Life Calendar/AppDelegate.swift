import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: DesignConstants.windowFrameWidth, height: DesignConstants.windowFrameHeight),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: ContentView())
        window.titlebarAppearsTransparent = true
        window.isMovableByWindowBackground = false
        window.titleVisibility = .visible
        window.backgroundColor = DesignConstants.windowBackgroundColor
        window.makeKeyAndOrderFront(nil)
    }

}

