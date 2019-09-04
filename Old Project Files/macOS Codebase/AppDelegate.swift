import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupWindow()
    }
    
    /// A helper function which creates a UIWindow and brings it front. It then creates an instance of WeeksViewController and sets it as the content of the window.
    func setupWindow() {
        // Create the window
        let windowSize = NSRect(x: 0, y: 0, width: 600, height: 600)
        let windowStyle: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .fullSizeContentView]
        
        window = NSWindow(contentRect: windowSize, styleMask: windowStyle, backing: .buffered, defer: false)
        
        window.makeKeyAndOrderFront(nil)

        // Style the window
        window.titlebarAppearsTransparent = true
        window.isMovableByWindowBackground = true
        window.titleVisibility = .visible
        window.title = "Life Calendar"
        window.backgroundColor = NSColor(hexString: Color.sceneBackground.rawValue)
        window.center()
        
        // Set the VC
        let weeksViewController = WeeksViewController()
        
        weeksViewController.window = window
        
        window.contentViewController = weeksViewController
    }
    
}
