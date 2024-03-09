import Foundation
import RealmSwift

public class LeaderboardEntryModel: Object, CachingDomain {
    @Persisted var userID: Int
    @Persisted var name: String
    @Persisted var totalPoints: Int

    public convenience init(entity: LeaderboardResponse) {
        self.init()
        self.userID = entity.userId
        self.name = entity.name
        self.totalPoints = entity.totalPoints
    }
}
