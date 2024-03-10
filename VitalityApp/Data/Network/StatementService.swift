//
//  StatementService.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine
protocol StatementService {
    @discardableResult
    func fetchStatement(
    ) -> AnyPublisher<StatementResponse, APIError>
}
