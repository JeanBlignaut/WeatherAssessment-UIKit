//
//  CurrentLocalWeather.swift
//  Weather-Assessment-UIKit
//
//  Created by Jean Blignaut on 2021/06/18.
//  Based on https://stackoverflow.com/questions/53687617/openweathermap-and-swift-4

import Foundation

struct CurrentLocalWeather: Decodable {
  let base: String
  let clouds: Clouds
  let cod: Int
  let coord: Coord
  let dt: Int
  let id: Int
  let main: Main
  let name: String
  let sys: Sys
  let visibility: Int
  let weather: [Weather]
  let wind: Wind
}

struct Clouds: Decodable {
  let all: Int
}
struct Coord: Decodable {
  let lat: Double
  let lon: Double
}
struct Main: Decodable {
  let humidity: Int
  let pressure: Int
  let temp: Double
  let tempMax: Double
  let tempMin: Double
  private enum CodingKeys: String, CodingKey {
    case humidity, pressure, temp, tempMax = "temp_max", tempMin = "temp_min"
  }
}
struct Sys: Decodable {
  let country: String
  let id: Int
  let message: Double?
  let sunrise: UInt64
  let sunset: UInt64
  let type: Int
}
struct Weather: Decodable {
  let description: String
  let icon: String
  let id: Int
  let main: String
}
struct Wind: Decodable {
  let deg: Int
  let speed: Double
}
