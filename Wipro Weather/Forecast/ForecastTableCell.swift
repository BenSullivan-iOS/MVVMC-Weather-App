//
//  ForecastTableCell.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 25/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

import UIKit

protocol Injectable {
  associatedtype T
  func inject(_: T)
  func assertDependencies()
}

class RedPillViewController: UIViewController, Injectable {
  
  //  weak private var mainLabel: UILabel!
  
  // this will be renamed to associatedtype in future versions of Swift
  // the type matches the IOU's type
  typealias T = String
  
  // this is my original dependency (IOU)
  // I can now make this private!
  private var mainText: String!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // this will crash if the IOU is not set
    assertDependencies()
    print("did load")
    // using the IOU if needed here,
    // but using it later is fine as well
    //    mainLabel.text = mainText
  }
  
  // Injectable Implementation
  func inject(_ text: T) {
    mainText = text
  }
  
  func assertDependencies() {
    assert(mainText != nil)
  }
}

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
