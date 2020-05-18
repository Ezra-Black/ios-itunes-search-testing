//
//  iTunes_SearchTests.swift
//  iTunes SearchTests
//
//  Created by Ezra Black on 5/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search
class iTunes_SearchTests: XCTestCase {

    func testForSomeResults() {
        let expectation = self.expectation(description: "Wait for results")
        let controller = SearchResultController()
        controller.performSearch(for: "GarageBand", resultType: .software) {
            print("⚠️Got Results Back.⚠️")
            XCTAssertGreaterThan(controller.searchResults.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
        XCTAssertGreaterThan(controller.searchResults.count, 0)
    }
    
    
    
    func testSpeedOfTypicalRequest() {
        measure {
            let expectation = self.expectation(description: "Wait for results")
            let controller = SearchResultController()
            controller.performSearch(for: "GarageBand", resultType: .software) {
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
        }
    }
    
    func testSpeedOfTypicalRequestMoreAccurately() {
        measureMetrics([.wallClockTime], automaticallyStartMeasuring: false) {
            let expectation = self.expectation(description: "Wait for results")
            let controller = SearchResultController()
            startMeasuring()
            controller.performSearch(for: "GarageBand", resultType: .software) {
                self.stopMeasuring()
                expectation.fulfill()
            }
            wait(for: [expectation], timeout: 5)
        }
    }
}
