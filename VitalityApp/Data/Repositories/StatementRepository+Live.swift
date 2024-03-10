//
//  StatementRepository.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine

final class StatementRepositoryLive: StatementRepository {

    private var localDataSource: StatementLocalDataSource
    private let statementService: StatementServiceLive

    init(localDataSource: StatementLocalDataSource, statementService: StatementServiceLive) {
        self.localDataSource = localDataSource
        self.statementService = statementService
    }

    private var loadedStatement: StatementResponse?

    // TODO: Consider calling Data from Local when we integrate the actual API
    // Used localDataSource fetchStatement() for calling Model from DB
    func loadStatement() -> AnyPublisher<Statement, APIError> {
        return statementService
            .fetchStatement()
            .map {[weak self] result -> Statement in

                let userCardModel = result.toCardDomain(leaderId: result.userId)
                let leaderBoardModel = result.leaderboard
                    .map {$0.toLeaderDomain(leaderId: $0.userId, statementResponse: result)}
                    .sorted {$0.rank < $1.rank}

                // Save Data in DB
                self?.saveStatement(response: result)

				let statement =  Statement(userCard: userCardModel, leaderboard: leaderBoardModel)

                return statement

            }.eraseToAnyPublisher()
    }

    func saveStatement(response: StatementResponse) {
        Task {
            let model = StatementModel(entity: response)
            await localDataSource.saveStatement(model)
            LogDebug("StatementResponse saved successful")
        }

    }
}
