//
//  API-Settings.swift
//  Weather-Assessment-UIKit
//
//  Created by Jean Blignaut on 2021/06/18.
//

import Foundation

enum AppConfig {
  
  static let apiBaseURL = URL(string: "http://api.openweathermap.org/data/2.5/")!
  static let weatherEndpoint =  apiBaseURL.appendingPathComponent("weather")
  static let forecastEndpoint = apiBaseURL.appendingPathComponent("forecast")
  static let token = URLQueryItem(name: "APPID", value: "2593046034309e729a5b132ce36b8f10")
  static let units = URLQueryItem(name: "units", value: "metric")
  
  static func weatherUrl(city: String, state: String, country: String) -> URL? {
    return formUrl(endpoint: weatherEndpoint, city: city, state: state, country: country)
  }
  
  static func forecastUrl(city: String, state: String, country: String) -> URL? {
    return formUrl(endpoint: forecastEndpoint, city: city, state: state, country: country)
  }
  
  private static func formUrl(endpoint: URL, city: String, state: String, country: String) -> URL? {
    var components = URLComponents(url: endpoint, resolvingAgainstBaseURL: false)!
    let city = URLQueryItem(name:"q", value: "metric")
    
    components.queryItems = [units, city, token]
    
    return components.url
  }
}
