//
//  Weather_Assessment_UIKitTests.swift
//  Weather-Assessment-UIKitTests
//
//  Created by Jean Blignaut on 2021/06/11.
//

import XCTest

@testable import Weather_Assessment_UIKit

class Weather_Assessment_UIKitTests: XCTestCase {
    
  func testDecodingWeatherData() async throws {
    let bundle = Bundle(for: type(of: self))
    
    guard let url = bundle.url(forResource: "London", withExtension: "json") else {
      XCTFail("Missing file: London.json")
      return
    }
    
    let json = try Data(contentsOf: url)
    
    let weather = try JSONDecoder().decode(CurrentLocalWeather.self, from: json)
    
    XCTAssertEqual(weather.id, 2643743)
    XCTAssertEqual(weather.weather[0].main, "Drizzle")
  }
  
    func testCallWeatherAPIEndToEnd() async throws {

      let weatherPTA : CurrentLocalWeather = try await fetchAndDecode(url: AppConfig.weatherUrl(city: "Pretoria", state: "GP", country: "ZA")!)
      
      XCTAssertTrue(weatherPTA.id != 0)
    }
}
