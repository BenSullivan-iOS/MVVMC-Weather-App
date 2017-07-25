//
//  CoordinatorType.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

protocol CoordinatorType {
  func start()
  func transition(screen: Screen)
}

extension CoordinatorType {
  func transition(screen: Screen) { }
}
