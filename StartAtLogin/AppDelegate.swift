//
//  AppDelegate.swift
//  StartAtLogin
//
//  Created by Tyler Hall on 9/18/20.
//  Copyright © 2020 Tyler Hall. All rights reserved.
//

import Cocoa
import ServiceManagement

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func setLaunchOnLogin(shouldLaunch: Bool) {
        if let launcherBundleID = Bundle.main.bundleIdentifier?.appending(".Launcher") {
            SMLoginItemSetEnabled(launcherBundleID as CFString, shouldLaunch)
        }
    }
}
