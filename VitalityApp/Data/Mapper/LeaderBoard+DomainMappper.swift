//
//  LeaderBoard+DomainMappper.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
extension LeaderboardResponse {
    func toLeaderBoardDomain(leaderId: Int, statementResponse: StatementResponse) -> LeaderBoard {
        let rank = statementResponse.calculateRank(leaderId: leaderId)
        return LeaderBoard(
            userId: leaderId,
            name: name,
            totalPoints: totalPoints,
            rank: rank
        )
    }

}
