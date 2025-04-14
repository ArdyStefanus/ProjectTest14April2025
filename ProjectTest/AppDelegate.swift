//
//  AppDelegate.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        let nav1 = UINavigationController()
        let mainView = HomeTabBarController(nibName: NibFile.HOME_TABBAR, bundle: nil)
        nav1.viewControllers = [mainView]
        self.window?.rootViewController = nav1
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

