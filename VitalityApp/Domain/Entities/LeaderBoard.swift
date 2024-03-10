//
//  Statement.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
struct Leader: Equatable {
    let leaderId: Int
    let name: String
    let totalPoints: Int
    let rank: Int
}

extension Leader {
    func getPointTitle() -> String {
		return String(describing: "\(totalPoints.delimiter.orEmpty) \(totalPoints.points.orEmpty)")
    }

    func getLeaderTitle(userId: Int?) -> String {
		return String(describing: userId == leaderId ? Strings.LeaderBoard.currentUserTitle : name).capitalized
    }
}
