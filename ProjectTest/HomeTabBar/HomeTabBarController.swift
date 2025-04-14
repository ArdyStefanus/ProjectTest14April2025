//
//  HomeTabBarController.swift
//  ProjectTest
//
//  Created by Macbook Pro on 14/04/25.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabbar()
    }
    
    func setupTabbar() {
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
        let tabBerandaItem = UITabBarItem(title: "Beranda", image: #imageLiteral(resourceName: "tabbar beranda"), selectedImage: #imageLiteral(resourceName: "tabbar beranda selected"))
        let tabAkunItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "tabbar akun"), selectedImage: #imageLiteral(resourceName: "tabbar akun selected"))
        
        self.tabBar.tintColor = #colorLiteral(red: 0.9179999828, green: 0.125, blue: 0.2119999975, alpha: 1)
        
        self.viewControllers = [
            createNavController(for: TabListBerandaVC(), tabbarItem: tabBerandaItem),
            createNavController(for: TabAkunVC(), tabbarItem: tabAkunItem)
        ]
    }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController, tabbarItem: UITabBarItem) -> UIViewController {
        // if want to change the view become root in the future, use below
        //        let navController = UINavigationController(rootViewController: rootViewController)
        let navController = rootViewController
        navController.tabBarItem = tabbarItem
        return navController
    }
}
