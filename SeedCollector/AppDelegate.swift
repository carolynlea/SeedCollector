//
//  AppDelegate.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Baskerville", size: 20)]
        UINavigationBar.appearance().titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
        
        let largeTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Baskerville-Bold", size: 45)]
        UINavigationBar.appearance().largeTitleTextAttributes = largeTextAttributes as [NSAttributedString.Key : Any]
        
        let buttonTextAttributes = [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 20)]
        UIBarButtonItem.appearance().setTitleTextAttributes(buttonTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        
        let tabBarTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 16)]
        
        UITabBarItem.appearance().setTitleTextAttributes(tabBarTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

