//
//  FetchStatementUseCase.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Combine
import Foundation

protocol FetchStatementUseCase {
    func execute() -> AnyPublisher<Statement, APIError>
}

final class FetchStatementUseCaseLive: FetchStatementUseCase {
    private var statementRepository: StatementRepository

    init(statementRepository: StatementRepository) {
        self.statementRepository = statementRepository
    }

    func execute() -> AnyPublisher<Statement, APIError> {
        return statementRepository.loadStatement()
    }
}
