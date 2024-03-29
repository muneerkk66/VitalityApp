//
//  MockStatementService.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 10/03/2024.
//

import Foundation
import Combine
@testable import VitalityApp

struct MockStatementService: StatementService {
    func fetchStatement() -> AnyPublisher<StatementResponse, APIError> {
        guard let fileURL = Bundle.main.url(forResource: AppEnvironment.development.jsonFile, withExtension: "json") else {
            return Fail(error: APIError.fileNotFound)
                .eraseToAnyPublisher()
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            return Just(jsonData)
                .decode(type: StatementResponse.self, decoder: JSONDecoder())
                .mapError { _ in APIError.applicationError }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError.fileNotFound)
                .eraseToAnyPublisher()
        }
    }

}
