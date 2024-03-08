import Foundation

public protocol PointsStatementAPI {
    func fetchPointsStatement() async throws -> PointsResponse?
}

public class MockAPI: PointsStatementAPI {
    public func fetchPointsStatement() async throws -> PointsResponse? {
        guard let data = DummyJSONFetcher.fetchDummyJsonData(jsonFileName: "mockPointsStatement") else { return nil }
        return PointsResponse(userInfoResponse: decodeServiceResponse(UserInfoResponse.self, data: data).0)
    }
}
