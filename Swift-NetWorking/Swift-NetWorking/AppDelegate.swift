//
//  AppDelegate.swift
//  Swift-Networking
//
//  Created by qjinliang on 2020/7/7.
//  Copyright © 2020 醉看红尘这场梦. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initRootViewController()
        return true
    }
    
    func initRootViewController() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainViewController()
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
    }

}

