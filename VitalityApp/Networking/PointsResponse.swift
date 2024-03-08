import Foundation

public struct PointsResponse: Decodable {
    public let userInfoResponse: UserInfoResponse?
}

public struct UserInfoResponse: Decodable {
    public let userId: Int
    public let name: String
    public let surname: String
    public let totalPoints: Int
    public let vitalityStatus: String
    public let leaderboard: [LeaderBoardResponse]
}

public struct LeaderBoardResponse: Decodable {
    public let userId: Int
    public let name: String
    public let totalPoints: Int
}

