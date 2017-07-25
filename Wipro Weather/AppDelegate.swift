//
//  AppDelegate.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 22/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()
    
    let appCoordinator = AppCoordinator(window: window!)
    
    appCoordinator.start()
    
    return true
  }
}
