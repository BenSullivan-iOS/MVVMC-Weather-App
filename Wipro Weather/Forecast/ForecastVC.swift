//
//  ViewController.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 22/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import UIKit

protocol ForecastVCDelegate {
  func reloadData()
}

class ForecastVC: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var viewModel: ForecastViewModelType?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "wipro weather"
  }
}

extension ForecastVC: ForecastVCDelegate {
  
  func reloadData() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

extension ForecastVC: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.forecasts?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as! ForecastTableCell
    
    if let forecasts = viewModel?.forecasts {
      
      cell.forecasts = forecasts[indexPath.row]
      cell.setDateLabel(text: viewModel?.dateHeaderText[indexPath.row])
      
      return cell
      
    }
    return cell
  }
}
