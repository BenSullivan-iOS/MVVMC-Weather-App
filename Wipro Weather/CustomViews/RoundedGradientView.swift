//
//  RoundedGradientView.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 25/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

class RoundedGradientView: UIView {
  
  internal var colors = [#colorLiteral(red: 0, green: 0.4526865697, blue: 0.8437882798, alpha: 1).cgColor, #colorLiteral(red: 0, green: 0.3394995246, blue: 0.6328125, alpha: 1).cgColor]
  
  override class var layerClass:AnyClass {
    get {
      return CAGradientLayer.self
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    
    guard let gradient = layer as? CAGradientLayer else {
      return
    }
    
    gradient.startPoint = CGPoint(x: 0, y: 0)
    gradient.endPoint = CGPoint(x: 0, y: 1)
    gradient.colors = colors
    
    layer.cornerRadius = 20

    clipsToBounds = true
  }
  
}
