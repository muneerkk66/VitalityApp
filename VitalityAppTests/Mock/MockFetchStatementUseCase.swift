//
//  MockFetchStatementUseCase.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 10/03/2024.
//

import Foundation
@testable import VitalityApp

import Combine

// Mock FetchStatementUseCase for testing
class MockFetchStatementUseCase: FetchStatementUseCase {

    let result: Result<Statement, APIError>

    init(result: Result<Statement, APIError>) {
        self.result = result
    }

    func execute() -> AnyPublisher<Statement, APIError> {
        return result.publisher.eraseToAnyPublisher()
    }
}

extension MockFetchStatementUseCase {
    static func success(with result: Statement) -> MockFetchStatementUseCase {
        return MockFetchStatementUseCase(result: .success(result))
    }

    static func failure(error: APIError) -> MockFetchStatementUseCase {
        return MockFetchStatementUseCase(result: .failure(error))
    }
}
