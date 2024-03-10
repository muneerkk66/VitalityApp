//
//  Rank+DomainMapper.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

extension StatementResponse {

    func toCardDomain(leaderId: Int) -> UserCard {
        let rank = calculateRank(leaderId: leaderId)
        let user = User(name: name, surname: surname)
        return UserCard(
            userId: userId,
            fullName: user.fullName(),
            totalPoints: totalPoints,
            rank: rank,
            status: vitalityStatus
        )
    }

    func toLeaderBoardDomain(leaderId: Int) -> Leader {
        let rank = calculateRank(leaderId: leaderId)
        return Leader(
            leaderId: leaderId,
            name: name,
            totalPoints: totalPoints,
            rank: rank
        )
    }

    // Calculate rank based on totalPoints
    public func calculateRank(leaderId: Int) -> Int {
        var leaderboardWithMainUser = leaderboard
        let mainLeader = LeaderboardResponse(userId: userId, name: name, totalPoints: totalPoints)
        leaderboardWithMainUser.append(mainLeader)
        let sortedLeaderboard = leaderboardWithMainUser.sorted { $0.totalPoints > $1.totalPoints }
        if let index = sortedLeaderboard.firstIndex(where: { $0.userId == leaderId }) {
            return (index + 1)
        }

        return 0
    }

}
