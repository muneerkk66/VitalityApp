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
    func request<Response: Decodable>() -> AnyPublisher<Response, APIError> {
        return  Just(MockData.statementResponse as! Response)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
}
