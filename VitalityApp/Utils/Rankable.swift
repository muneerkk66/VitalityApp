//
//  Rankable.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

protocol Rankable {
    var userId: Int { get }
}

extension Rankable where Self: Equatable {
    func rank(in response: StatementResponse, leaderId: Int) -> String {
        var leaderboardWithMainUser = response.leaderboard
        let mainLeader = LeaderboardResponse(userID: userId, name: response.name, totalPoints: response.totalPoints)
        // Include main user in the leaderboard
        leaderboardWithMainUser.append(mainLeader)
        let sortedLeaderboard = leaderboardWithMainUser.sorted { $0.totalPoints > $1.totalPoints }
        if let index = sortedLeaderboard.firstIndex(where: { $0.userID == leaderId }) {
            return (index + 1).ordinal ?? ""
        }
        return ""
    }
}
