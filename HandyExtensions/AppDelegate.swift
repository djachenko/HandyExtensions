//
//  AppDelegate.swift
//  HandyExtensions
//
//  Created by Igor Djachenko on 08/12/2019.
//  Copyright © 2019 Igor Djachenko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootVC = ViewController()

        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()

        return true
    }
}

