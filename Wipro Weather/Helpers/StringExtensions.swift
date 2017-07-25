//
//  StringExtensions.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 25/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

extension String {
  
  func asDate() -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let date = dateFormatter.date(from: self) ?? Date()
    return date
  }
}

func timeStringFromDate(date: Date) -> String {
  
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "HH:mm"
  let dateString = dateFormatter.string(from: date)
  
  return dateString
}

func stringFromDate(date: Date) -> String {
  
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "d'\(daySuffix(date: date))' MMM"
  let dateString = dateFormatter.string(from: date)
  
  return dateString
}

func daySuffix(date: Date) -> String {
  let calendar = Calendar.current
  let dayOfMonth = calendar.component(.day, from: date)
  
  switch dayOfMonth {
    
  case 1, 21, 31 : return "st"
  case 3, 23  : return "rd"
  case 2, 22  : return "nd"
    
  default : return "th"
  }
}
