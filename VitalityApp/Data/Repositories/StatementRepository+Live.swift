//
//  StatementRepository.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Combine

final class StatementRepositoryLive: StatementRepository {

    private var statementService: StatementService

    init(statementService: StatementService) {
        self.statementService = statementService
    }

    func fetchStatement() -> AnyPublisher<Statement, APIError> {
        return statementService
            .fetchStatement()
            .map { result -> Statement in

                let userCardModel = result.toCardDomain(leaderId: result.userId)
                let leaderBoardModel = result.leaderboard.map {$0.toLeaderBoardDomain(leaderId: $0.userId, statementResponse: result)}.sorted {$0.rankValue < $1.rankValue}
                return Statement(card: userCardModel, leaderBoard: leaderBoardModel)

            }.eraseToAnyPublisher()
    }

    func saveStatement() {

    }
}
