import XCTest
import SnapshotTesting
@testable import VitalityApp

@MainActor
final class VitalityAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func testDefaultAppearanceWithSuccess ( ) {
		let contentView = HomeView(viewModel: HomeViewModel(coordinator: MockHomeCoordinator(), fetchStatementUseCase: MockFetchStatementUseCase.success(with: MockResponse.statement)))

		assertSnapshot(of: contentView.toVC(), as: .image)
	}

	func testDefaultAppearanceWithError ( ) {
		let contentView = HomeView(viewModel: HomeViewModel(coordinator: MockHomeCoordinator(), fetchStatementUseCase: MockFetchStatementUseCase.failure(error: APIError.applicationError)))

		assertSnapshot(of: contentView.toVC(), as: .image)
	}

	func testStatementView ( ) {
		let statementView = StatementView(viewModel: HomeViewModel(coordinator: MockHomeCoordinator(), fetchStatementUseCase: MockFetchStatementUseCase.success(with: MockResponse.statement)))

		assertSnapshot(of: statementView.toVC(), as: .image)
	}

	func testErroView() {
		let errorView = ErrorView(errorMessage: "error") {}
		assertSnapshot(of: errorView.toVC(), as: .image)
	}


    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
