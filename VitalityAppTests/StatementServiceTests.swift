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

    func testFetchStatementWithFormattedData() throws {
        let result = try awaitPublisher(model.fetchStatement())
        XCTAssertTrue(try XCTUnwrap(result.leaderboard.count) > 0)

        // Verify Rank calculation
        let card = result.toCardDomain(leaderId: result.userId)
        XCTAssertGreaterThan(card.rank, 0)
        let leader = result.toLeaderBoardDomain(leaderId: try XCTUnwrap( result.leaderboard.first?.userId))
        XCTAssertGreaterThan(leader.rank, 0)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
