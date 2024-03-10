//
//  StatementRepository.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine

final class StatementRepositoryLive: StatementRepository {

    private var localDataSource: StatementLocalDataSource
    private let statementService: StatementService

    init(localDataSource: StatementLocalDataSource, statementService: StatementService) {
        self.localDataSource = localDataSource
        self.statementService = statementService
    }

    private var loadedStatement: StatementResponse?

    // TODO: Optimise data loading by initially fetching from local storage before integrating with the actual API. This will reduce loading times. Background tasks can then fetch remote data and update the database, ensuring the latest data is displayed to the user.

    // Use localDataSource.fetchStatement() to retrieve data from the database.

    // Additionally, consider implementing StatementRemoteDataSource for handling service calls.

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
