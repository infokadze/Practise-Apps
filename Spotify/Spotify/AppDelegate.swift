//
//  AppDelegate.swift
//  Spotify
//
//  Created by Harry Crocks on 28.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: TitleBarController())
        window?.rootViewController = navigationController
        
//        window?.rootViewController = HomeController()
        
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = .label
        
        
        return true
    }
    
}
