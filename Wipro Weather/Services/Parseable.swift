//
//  Parseable.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

enum ParseResult {
  case success(forecast: ForecastProvider)
  case error(message: String)
}

protocol Parsable {
  
  func parseJSONData(withForecastData data: Data) -> ParseResult
}

extension Parsable {
  
  func parseJSONData(withForecastData data: Data) -> ParseResult {
    
    do {
      
      let jsonDecoder = JSONDecoder()
      let forecast = try jsonDecoder.decode(ForecastProvider.self, from: data)
      
      return ParseResult.success(forecast: forecast)
      
    }
    catch {
      print("error", error)
      return ParseResult.error(message: error.localizedDescription)
    }
  }

}
