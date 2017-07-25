//
//  ForecastViewModel.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

protocol ForecastViewModelType {
  var forecasts: [[Forecast]]? { get set }
  var dateHeaderText: [String] { get set }
  var coordinator: CoordinatorType? { get }
}

class ForecastViewModel: ForecastViewModelType, Downloadable, Parsable {
  
  var forecastVCDelegate: ForecastVCDelegate?
  var coordinator: CoordinatorType?
  
  var forecasts: [[Forecast]]?
  var dateHeaderText: [String]
  
  init() {
    
    dateHeaderText = ["Today", "Tomorrow"]
    
    downloadData(withURLString: LocationURL.london) { data, error in
      
      guard let data = data, error == nil else { return }
      
      let parseResult = self.parseJSONData(withForecastData: data)
      
      switch parseResult {
        
      case .success(let result):
        self.createForecasts(forecastProvider: result)
        self.forecastVCDelegate?.reloadData()
        
      case .error(let message):
        print(message)
      }
    }
  }
  
  //
  //  Creates multidimensional array, each element represents another day
  //  Requires refactoring to make it flexible for any amount of results
  //
  func createForecasts(forecastProvider: ForecastProvider) {
    
    var tempForecasts = [[Forecast]](repeating: [Forecast](), count: 5)
    
    forecastProvider.forecasts.forEach({ item in
      
      let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
      
      let day2 = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
      let day3 = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
      let day4 = Calendar.current.date(byAdding: .day, value: 3, to: Date())!
      let day5 = Calendar.current.date(byAdding: .day, value: 4, to: Date())!
      
      if calendar.isDateInToday(item.date) {
        tempForecasts[0].append(item)
        return
      }
      if calendar.isDate(item.date, equalTo: day2, toGranularity: .day) {
        tempForecasts[1].append(item)
        return
      }
      if calendar.isDate(item.date, equalTo: day3, toGranularity: .day) {
        tempForecasts[2].append(item)
        populateDateHeaderText(withDate: item.date)
        return
      }
      if calendar.isDate(item.date, equalTo: day4, toGranularity: .day) {
        tempForecasts[3].append(item)
        populateDateHeaderText(withDate: item.date)
        return
      }
      if calendar.isDate(item.date, equalTo: day5, toGranularity: .day) {
        tempForecasts[4].append(item)
        populateDateHeaderText(withDate: item.date)
      }
      
    })
    self.forecasts = tempForecasts
  }
  
  func populateDateHeaderText(withDate date: Date) {
    
    let formattedDateString = stringFromDate(date: date)
    
    if !dateHeaderText.contains(formattedDateString) {
      dateHeaderText.append(formattedDateString)
    }
  }
  
}
