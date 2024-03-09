//
//  StatementRepository.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine

protocol StatementRepository {

    @discardableResult
    func fetchStatement() -> AnyPublisher<Statement, APIError>

    func saveStatement()
}
