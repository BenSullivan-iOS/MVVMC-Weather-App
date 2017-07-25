//
//  ForecastTableCell.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 25/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

class ForecastTableCell: UITableViewCell {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var dateLabel: UILabel!
  
  var forecasts: [Forecast]?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    collectionView.dataSource = self
  }
  
  func setDateLabel(text: String?) {
    
    guard let text = text else {
      dateLabel.text = stringFromDate(date: forecasts![0].date)
      return
    }
    
    dateLabel.text = text
  }
  
}

extension ForecastTableCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return forecasts?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "forecastCollectionCell", for: indexPath) as! ForecastCollectionCell
    
    cell.configureCell(withForecast: forecasts?[indexPath.row])
    
    return cell
  }
}
