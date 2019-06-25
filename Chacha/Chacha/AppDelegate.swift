//
//  AppDelegate.swift
//  Chacha
//
//  Created by hyeoktae kwon on 2019/06/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainVC()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
//    func applicationWillResignActive(_ application: UIApplication) {
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//    }
}

