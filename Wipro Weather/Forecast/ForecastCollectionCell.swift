//
//  ForecastCollectionCell.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 25/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

class ForecastCollectionCell: UICollectionViewCell {
  
  @IBOutlet weak var tempLabel: UILabel!
  @IBOutlet weak var tempImage: UIImageView!
  @IBOutlet weak var timeLabel: UILabel!
  
  func configureCell(withForecast forecast: Forecast?) {
    
    guard let forecast = forecast else { return }
    
    let temp = forecast.temperature.value
    timeLabel?.text = forecast.time
    
    tempLabel?.text = String(format: "%.0f", temp - 273.15) + "°"
    
    forecast.weather[0].downloadIconImage(completion: { result in
      
      switch result {
        
      case .value(let val):
        
        DispatchQueue.main.async {
          self.tempImage.image = UIImage(data: val)
        }
        
      case .error(message: let msg):
        print(msg)
      }
    })
  }
}

