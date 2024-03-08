import Foundation

public struct LeaderboardEntry {
    var userID: Int
    var name: String
    var totalPoints: Int
    
    init(userID: Int, name: String, totalPoints: Int) {
        self.userID = userID
        self.name = name
        self.totalPoints = totalPoints
    }
    
    init(model: LeaderboardEntryModel) {
        self.userID = model.userID
        self.name = model.name
        self.totalPoints = model.totalPoints
    }
}
