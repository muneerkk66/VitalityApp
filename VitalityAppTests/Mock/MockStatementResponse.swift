//
//  MockStatementResponse.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

struct MockData {
    static let statementResponse = StatementResponse(
        userId: 1,
        name: "Test",
        surname: "",
        totalPoints: 1,
        vitalityStatus: "",
        leaderboard: [leader]
    )

    static let leader = LeaderboardResponse(userId: 2, name: "test", totalPoints: 2)

    static let userCard = UserCard(userId: 1, fullName: "", totalPoints: 1, rank: 1, status: "")

    static let leaderBoard = Leader(leaderId: 1, name: "test", totalPoints: 1, rank: 1)

}
