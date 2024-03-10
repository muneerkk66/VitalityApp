//
//  PreviewData.swift
//  VitalityApp
//
//  Created by Muneer K K on 10/03/2024.
//

import Foundation

struct PreviewData {
    static let statementResponse = StatementResponse(
        userId: 1,
        name: "Test",
        surname: "",
        totalPoints: 1,
        vitalityStatus: "",
        leaderboard: [leaderResponse]
    )

    static let leaderResponse = LeaderboardResponse(userId: 2, name: "test", totalPoints: 2)

    static let userCard = UserCard(userId: 1, fullName: "", totalPoints: 1, rank: 1, status: "")

    static let leader = Leader(leaderId: 1, name: "test", totalPoints: 1, rank: 1)

    static let statement = Statement(userCard: userCard, leaderboard: [leader])

}
