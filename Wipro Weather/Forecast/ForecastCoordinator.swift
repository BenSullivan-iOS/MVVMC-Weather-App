//
//  ForecastCoordinator.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

struct ForecastCoordinator: CoordinatorType {
  
  let navController: UINavigationController
  
  init(navController: UINavigationController) {
    self.navController = navController
  }
  
  func start() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    if let forcastVC = storyboard.instantiateViewController(withIdentifier: "ForecastStoryboardID") as? ForecastVC {
      
      let viewModel = ForecastViewModel()
      forcastVC.viewModel = viewModel
      viewModel.forecastVCDelegate = forcastVC
      
      navController.viewControllers = [forcastVC]
    }
  }
  func transition(screen: Screen) {
    //Handles transitions to other screens
  }
}

