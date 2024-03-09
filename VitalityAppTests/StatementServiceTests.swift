//
//  StatementServiceTests.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

import XCTest
@testable import VitalityApp

final class StatementServiceTests: XCTestCase {
    var model: StatementServiceLive!
    override func setUpWithError() throws {
        model = StatementServiceLive(apiClient: MockAPIClient())

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let page = 1
        let searchText = "Test"
        let result = try awaitPublisher(model.fetchStatement())
        XCTAssertTrue(try XCTUnwrap(result.leaderboard.count) > 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
