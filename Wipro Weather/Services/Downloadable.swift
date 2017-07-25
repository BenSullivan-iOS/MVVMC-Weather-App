//
//  Downloadable.swift
//  Wipro Weather
//
//  Created by Ben Sullivan on 24/07/2017.
//  Copyright © 2017 Ben Sullivan. All rights reserved.
//

import Foundation

protocol Downloadable {
  
  func downloadImageData(withURLString urlString: String, completion: @escaping (_ image: Data?, _ error: String?) -> ())
  
  func downloadData(withURLString urlString: String, completion: @escaping (_ data: Data?, _ error: String?) -> ())
}

extension Downloadable {
  
  func downloadImageData(withURLString urlString: String, completion: @escaping (_ image: Data?, _ error: String?) -> ()) {
    
    guard let proceduresURL = URL(string: urlString) else {
      
      completion(nil, "Invalid URL")
      
      return
    }
    
    let request = URLRequest(url: proceduresURL)
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (imageData, URLResponse, error) in
      
      guard error == nil && imageData != nil else {
        
        return completion(nil, "Unable to download image")
      }
      
      return completion(imageData, nil)
      
    }
    task.resume()
  }
  
  func downloadData(withURLString urlString: String, completion: @escaping (_ data: Data?, _ error: String?) -> ()) {
    
    guard let proceduresURL = URL(string: urlString) else {
      
      completion(nil, "Invalid URL")
      
      return
    }
    
    let request = URLRequest(url: proceduresURL)
    let session = URLSession.shared
    
    let task = session.dataTask(with: request) { (data, URLResponse, error) in
      
      guard let data = data else {
        
        return completion(nil, "Unable to download data")
      }
      return completion(data, nil)
    }
    task.resume()
  }
  
}
