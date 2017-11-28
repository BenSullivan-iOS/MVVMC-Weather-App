//
//  Result.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 28/11/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

typealias ResultBlock<T> = (Result<T>) -> ()

enum Result<T> {
  case value(T)
  case error(_: String)
}
