//
//  HomeViewModelTests.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 10/03/2024.
//

import Foundation

import XCTest
@testable import VitalityApp

@MainActor
class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockFetchStatementUseCase: MockFetchStatementUseCase!

    override func setUp() {
        super.setUp()

        viewModel = HomeViewModel(coordinator: MockHomeCoordinator(), fetchStatementUseCase: MockFetchStatementUseCase.success(with: MockResponse.statement))

    }

    override func tearDown() {
        viewModel = nil
        mockFetchStatementUseCase = nil
        super.tearDown()
    }

    func testInitialState() {
        XCTAssertEqual(viewModel.viewState, .idle)
        XCTAssertNil(viewModel.statement)
    }

    func testRetry() throws {
        let exp = XCTestExpectation(description: "TestRetryLoadStatement")
        XCTAssertNil(viewModel.statement)
        viewModel.handle(.retryLoadStatement)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let statement = try XCTUnwrap(viewModel.statement)
            XCTAssertNotNil(statement)

        } else {
            XCTFail("Test Failed: retryLoadStatement")
        }

    }

    func testFetchStatementSuccess() throws {
        let exp = XCTestExpectation(description: "TestFetchStatementSuccess")
        viewModel.fetchStatement()
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            let statement = try XCTUnwrap(viewModel.statement)
            XCTAssertNotNil(statement)

        } else {
            XCTFail("Test Failed: FetchStatement Success")
        }
    }

    func testFetchStatementFailure() throws {
        let exp = XCTestExpectation(description: "TestFetchStatementFailure")
        viewModel = HomeViewModel(coordinator: MockHomeCoordinator(), fetchStatementUseCase: MockFetchStatementUseCase.failure(error: APIError.applicationError))

        viewModel.fetchStatement()
        let result = XCTWaiter.wait(for: [exp], timeout: 0.5)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertNil(viewModel.statement)
        } else {
            XCTFail("Test Failed: FetchStatement Failure")
        }
    }

}
