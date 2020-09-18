//
//  AppDelegate.swift
//  StartAtLogin.Launcher
//
//  Created by Tyler Hall on 9/18/20.
//  Copyright © 2020 Tyler Hall. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let mainAppIdentifier = Bundle.main.bundleIdentifier!.replacingOccurrences(of: ".Launcher", with: "")
        let runningApps = NSWorkspace.shared.runningApplications
        let isRunning = !runningApps.filter { $0.bundleIdentifier == mainAppIdentifier }.isEmpty

        if !isRunning {
            // Surely there's a better way I just don't know about, right?
            // The old launchAppWithBundleIdentifier:options:additionalEventParamDescriptor:launchIdentifier:
            // has been deprecated.
            let path = Bundle.main.bundlePath as NSString
            var components = path.pathComponents
            components.removeLast()
            components.removeLast()
            components.removeLast()
            components.removeLast()

            let mainAppPath = NSString.path(withComponents: components)
            let mainAppURL = URL(fileURLWithPath: mainAppPath)

            NSWorkspace.shared.openApplication(at: mainAppURL, configuration: .init()) { (_, _) in
                NSApp.terminate(nil)
            }
        } else {
            NSApp.terminate(nil)
        }
    }
}
