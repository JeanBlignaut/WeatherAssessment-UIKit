//
//  Weather_Assessment_UIKitTests.swift
//  Weather-Assessment-UIKitTests
//
//  Created by Jean Blignaut on 2021/06/11.
//

import XCTest

@testable import Weather_Assessment_UIKit

class Weather_Assessment_UIKitTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() async throws {

        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&units=metric&&APPID=2593046034309e729a5b132ce36b8f10")!
        
        let weatherDataRaw = try await URLSession.shared.data(with: url)
        
        assert(weatherDataRaw.isEmpty)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
