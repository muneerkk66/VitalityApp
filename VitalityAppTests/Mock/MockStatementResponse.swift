//
//  MockStatementResponse.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

import Foundation
@testable import VitalityApp

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

}
