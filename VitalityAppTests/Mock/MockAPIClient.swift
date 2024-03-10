//
//  MockStatementService.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
import Combine
@testable import VitalityApp
import Network

// Mock class to replace the actual implementation of APIClient
struct MockAPIClient: APIClient {
    func request<T: Decodable>() -> AnyPublisher<T, APIError> {
        guard let fileURL = Bundle.main.url(forResource: AppEnvironment.development.jsonFile, withExtension: "json") else {
            return Fail(error: APIError.fileNotFound)
                .eraseToAnyPublisher()
        }
        do {
            let jsonData = try Data(contentsOf: fileURL)
            return Just(jsonData)
                .decode(type: T.self, decoder: JSONDecoder())
                .mapError { _ in APIError.applicationError }
                .eraseToAnyPublisher()
        } catch {
            return Fail(error: APIError.fileNotFound)
                .eraseToAnyPublisher()
        }
    }
}
