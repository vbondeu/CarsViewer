//
//  AppDelegate.swift
//  BVCarSharing
//
//  Created by VBond on 4/3/17.
//  Copyright © 2017 VBond. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appDependies = AppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return self.appDependies.installRootViewControllerIntoWindow(window: self.window!)
    }

}

