//
//  StatementService+Live.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine

final class StatementServiceLive {
    private var apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
}

extension StatementServiceLive: StatementService {
    func fetchStatement(
    ) -> AnyPublisher<StatementResponse, APIError> {
        return apiClient.request()
    }
}
