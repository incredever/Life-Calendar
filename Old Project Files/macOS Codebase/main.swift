import Cocoa

/// Creates the main menu for the macOS menu bar. Because we are not using IB, this function manually creates all basic functionality one would expect an app to have including things like quit (⌘Q) and minimize (⌘M).
func makeMainMenu() -> NSMenu {
    let mainMenu = NSMenu()
    let mainAppMenuItem = NSMenuItem(title: "Application", action: nil, keyEquivalent: "")
    let mainFileMenuItem = NSMenuItem(title: "File", action: nil, keyEquivalent: "")
    let mainWindowMenuItem = NSMenuItem(title: "Window", action: nil, keyEquivalent: "")

    mainMenu.addItem(mainAppMenuItem)
    mainMenu.addItem(mainFileMenuItem)
    mainMenu.addItem(mainWindowMenuItem)

    let appMenu = NSMenu()
    mainAppMenuItem.submenu = appMenu

    let appServicesMenu = NSMenu()
    NSApp.servicesMenu = appServicesMenu

    appMenu.addItem(withTitle: "About Life Calendar", action: nil, keyEquivalent: "")
    appMenu.addItem(NSMenuItem.separator())
    appMenu.addItem(withTitle: "Preferences...", action: nil, keyEquivalent: ",")
    appMenu.addItem(NSMenuItem.separator())
    appMenu.addItem(withTitle: "Hide Me", action: #selector(NSApplication.hide(_:)), keyEquivalent: "h")
    appMenu.addItem({ () -> NSMenuItem in
        let m = NSMenuItem(title: "Hide Others", action: #selector(NSApplication.hideOtherApplications(_:)), keyEquivalent: "h")
        m.keyEquivalentModifierMask = [.command, .option]
        return m
        }())
    appMenu.addItem(withTitle: "Show All", action: #selector(NSApplication.unhideAllApplications(_:)), keyEquivalent: "")

    appMenu.addItem(NSMenuItem.separator())
    appMenu.addItem(withTitle: "Quit Life Calendar", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")

    let fileMenu = NSMenu(title: "File")
    mainFileMenuItem.submenu = fileMenu
    fileMenu.addItem(withTitle: "New...", action: #selector(NSDocumentController.newDocument(_:)), keyEquivalent: "n")
    
    let windowMenu = NSMenu(title: "Window")
    mainWindowMenuItem.submenu = windowMenu
    windowMenu.addItem(withTitle: "Minimize", action: #selector(NSWindow.miniaturize(_:)), keyEquivalent: "m")
    
    return mainMenu
}

/// An instance of our AppDelegate class which handles, among other things, the app life cycle events.
let delegate = AppDelegate()

/// Set menu, delegate, and start the main event loop
NSApplication.shared.mainMenu = makeMainMenu()
NSApplication.shared.delegate = delegate
NSApplication.shared.run()


