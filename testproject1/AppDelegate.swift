//
//  AppDelegate.swift
//  testproject1
//
//  Created by Даниил Вахрамеев on 23.02.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate { 


    var window: UIWindow?
    var navbar = UINavigationController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let flightsViewController = FlightsVC()
        let secondViewController = InANutshellVC()
        let thirdViewController = SettingsVC()
        let tabbarController = UITabBarController()
        
        tabbarController.setViewControllers([flightsViewController,secondViewController,thirdViewController], animated: true)
        tabbarController.tabBar.tintColor = .white
        tabbarController.tabBar.backgroundColor = .clear
        
        tabbarController.tabBar.unselectedItemTintColor = .white
        flightsViewController.tabBarItem.image = UIImage(systemName: "house.fill")
        flightsViewController.tabBarItem.title = "Home"
        
        thirdViewController.tabBarItem.image = UIImage(systemName: "gear")
        thirdViewController.tabBarItem.title = "Settings"
        
        secondViewController.tabBarItem.image = UIImage(systemName: "photo.circle.fill")
        secondViewController.tabBarItem.title = "In a nutshell"
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = tabbarController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

