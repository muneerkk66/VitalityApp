import Foundation
import RealmSwift

public class StatementModel: Object {
    @Persisted(primaryKey: true) var userID: Int
    @Persisted var name: String
    @Persisted var surname: String
    @Persisted var totalPoints: Int
    @Persisted var vitalityStatus: String
    @Persisted var leaderboard: List<LeaderboardEntryModel>

    public convenience init(entity: StatementResponse) {
        self.init()
        self.userID = entity.userId
        self.name = entity.name
        self.surname = entity.surname
        self.totalPoints = entity.totalPoints
        self.vitalityStatus = entity.vitalityStatus
        self.leaderboard.append(objectsIn: entity.leaderboard.map(LeaderboardEntryModel.init))
    }

}



