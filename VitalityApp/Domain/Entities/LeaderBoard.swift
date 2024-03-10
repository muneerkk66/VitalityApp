//
//  Statement.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
struct LeaderBoard: Equatable {
    let userId: Int
    let name: String
    let totalPoints: Int
    let rank: Int
}

extension LeaderBoard {
    func getPointTitle() -> String {
        return String(describing: "\(totalPoints.delimiter ?? "") \(totalPoints.points ?? "")")
    }

    func getLeaderTitle(leaderId: Int?) -> String {
		return String(describing: userId == leaderId ? Strings.LeaderBoard.currentUserTitle : name).capitalized
    }
}
