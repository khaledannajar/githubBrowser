//
//  AppDelegate.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        if let navController = Storyboards.Main.initialViewController() as? UINavigationController {
            appCoordinator = AppCoordinator(navController: navController)
            window?.rootViewController = navController
            appCoordinator.start()
        }
        window?.makeKeyAndVisible()
        
        return true
    }
}

