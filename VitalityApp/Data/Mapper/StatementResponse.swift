import Foundation

public struct StatementResponse: Decodable {
    var userId: Int
    var name: String
    var surname: String
    var totalPoints: Int
    var vitalityStatus: String
    var leaderboard: [LeaderboardResponse]

}

public struct LeaderboardResponse: Decodable {
    var userId: Int
    var name: String
    var totalPoints: Int
}
