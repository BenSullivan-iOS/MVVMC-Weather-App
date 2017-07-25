//
//  AppCoordinator.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

struct AppCoordinator: CoordinatorType {
  
  let window: UIWindow
  
  init(window: UIWindow) {
    self.window = window
  }
  
  func start() {
    let navigationController = UINavigationController()
    navigationController.view.frame = window.frame
    
    window.rootViewController = navigationController
    
    let forecastCoordinator = ForecastCoordinator(navController: navigationController)
    
    forecastCoordinator.start()
    
  }
  
}
