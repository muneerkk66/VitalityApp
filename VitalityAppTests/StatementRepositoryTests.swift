//
//  StatementRepositoryTests.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 10/03/2024.
//

import Combine
@testable import VitalityApp
import XCTest

final class StatementRepositoryTests: XCTestCase {

    var model: StatementRepositoryLive!
    var mockStatementLocalDataSource: MockStatementLocalDataSource!
    var mockStatementService: MockStatementService!

    override func setUpWithError() throws {
        mockStatementService = MockStatementService()
        mockStatementLocalDataSource = MockStatementLocalDataSource()
        model = StatementRepositoryLive(localDataSource: mockStatementLocalDataSource, statementService: mockStatementService)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchStatement() throws {
        let result = try awaitPublisher(model.loadStatement())
        XCTAssertTrue(result.leaderboard.count > 0)
        XCTAssertNotNil(result.userCard.userId)
        XCTAssertGreaterThan(result.userCard.rank, 0)
    }

    func testCheckModelDataFormat() throws {
        let result = try awaitPublisher(model.loadStatement())

        // Plural check for points
        var leader = try XCTUnwrap(result.leaderboard.first)
        XCTAssertTrue(leader.getPointTitle().contains("points"))
        leader = try XCTUnwrap(result.leaderboard.last)
        XCTAssertTrue(leader.getPointTitle().contains("point"))

        // User card title check
        XCTAssertTrue(result.userCard.getCardTitle().contains(result.userCard.fullName))
        XCTAssertEqual(result.userCard.getCardTitle(), "\(Strings.CardView.titleGreetings), \(result.userCard.fullName)")

        // User card vitality status check
        XCTAssertTrue(result.userCard.vitalityStatus().contains(result.userCard.status))
        XCTAssertEqual(result.userCard.vitalityStatus(), "\(result.userCard.status) \(Strings.CardView.statusPostFix)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
