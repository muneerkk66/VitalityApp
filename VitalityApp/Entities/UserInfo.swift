import Foundation

public struct UserInfo: Equatable {
    var userID: Int
    var name: String
    var surname: String
    var totalPoints: Int
    var vitalityStatus: String
    var leaderboard: [LeaderboardEntry]
    
    init(userID: Int, name: String, surname: String, totalPoints: Int, vitalityStatus: String, leaderboard: [LeaderboardEntry]) {
        self.userID = userID
        self.name = name
        self.surname = surname
        self.totalPoints = totalPoints
        self.vitalityStatus = vitalityStatus
        self.leaderboard = leaderboard
    }
    
    init(model: UserInfoModel) {
        self.userID = model.userID
        self.name = model.name
        self.surname = model.surname
        self.totalPoints = model.totalPoints
        self.vitalityStatus = model.vitalityStatus
        self.leaderboard = model.leaderboard.compactMap(LeaderboardEntry.init)
    }
    
    public static func == (lhs: UserInfo, rhs: UserInfo) -> Bool {
        lhs.userID == rhs.userID
    }
}
