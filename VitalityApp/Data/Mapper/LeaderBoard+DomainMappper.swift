//
//  LeaderBoard+DomainMappper.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
extension LeaderboardResponse {
    func toLeaderDomain(leaderId: Int, statementResponse: StatementResponse) -> Leader {
        let rank = statementResponse.calculateRank(leaderId: leaderId)
        return Leader(
            leaderId: leaderId,
            name: name,
            totalPoints: totalPoints,
            rank: rank
        )
    }

}
