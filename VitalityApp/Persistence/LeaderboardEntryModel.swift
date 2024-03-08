import Foundation
import RealmSwift

public class LeaderboardEntryModel: Object, CachingDomain {
    @Persisted var userID: Int
    @Persisted var name: String
    @Persisted var totalPoints: Int
    
    public convenience init(entity: LeaderboardEntry) {
        self.init()
        self.userID = entity.userID
        self.name = entity.name
        self.totalPoints = entity.totalPoints
    }
}
