//
//  Parseable.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

protocol Parsable { }

extension Parsable {
  
  func parseJSONData(withForecastData data: Data, completion: ResultBlock<ForecastProvider>) {
    
    do {
      
      let jsonDecoder = JSONDecoder()
      let forecast = try jsonDecoder.decode(ForecastProvider.self, from: data)
      
      completion(Result.value(forecast))
      
    }
    catch {
      print("error", error)
      completion(Result.error(error.localizedDescription))
    }
  }
  
}
