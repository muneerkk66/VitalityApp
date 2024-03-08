import Foundation

public protocol PointsGateway {
    func fetch() async
}

public class ConcretePointsGateway: PointsGateway {
    private let pointsAPI: PointsStatementAPI
    private let realmAdapter: RealmAdapter
    
    init(_ realmAdapter: RealmAdapter,
         _ pointsAPI: PointsStatementAPI) {
        self.realmAdapter = realmAdapter
        self.pointsAPI = pointsAPI
    }

    public func fetch() async { }
}
