import Foundation
import Swinject

// Resolver is a singleton class that is responsible for injecting all dependencies in the app.
final class Resolver {

    static let shared = Resolver()

    private var container = Container()

    // This method is responsible for injecting all dependencies in the app.
    @MainActor func injectModules() {
        injectCoordinator()
        injectUtils()
        injectServices()
        injectDataSources()
        injectRepositories()
        injectUseCases()
        injectViewModels()

    }
    /// - Parameter type: The type of the dependency to be resolved.
    /// - Returns: The resolved dependency.
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}

// MARK: - Injecting Utils -

extension Resolver {
    private func injectUtils() {
        container.register(APIClientLive.self) { _ in
            APIClientLive()
        }.inObjectScope(.container)

        container.register(RealmProvider.self) { _ in
            RealmProvider()
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Coordinator -

extension Resolver {
    private func injectCoordinator() {
        container.register(AppCoordinator.self) { _ in
            AppCoordinator()
        }.inObjectScope(.container)

        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator()
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Services -

extension Resolver {
    private func injectServices() {
        container.register(StatementServiceLive.self) { resolver in
            StatementServiceLive(apiClient: resolver.resolve(APIClientLive.self)!)
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting DataSources -

extension Resolver {
    private func injectDataSources() {
        container.register(StatementLocalDataSource.self) { resolver in
            StatementLocalDataSourceLive(realmProvider: resolver.resolve(RealmProvider.self)!)
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Repositories -

extension Resolver {

    private func injectRepositories() {
        container.register(StatementRepositoryLive.self) { resolver in
            StatementRepositoryLive(localDataSource: resolver.resolve(StatementLocalDataSource.self)!, statementService: resolver.resolve(StatementServiceLive.self)!)
        }.inObjectScope(.container)

        container.register(HomeCoordinator.self) { _ in
            HomeCoordinator()
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting Use Cases -

extension Resolver {

    private func injectUseCases() {
        container.register(FetchStatementUseCase.self) { resolver in
            FetchStatementUseCaseLive(statementRepository: resolver.resolve(StatementRepositoryLive.self)!)
        }.inObjectScope(.container)

    }
}

// MARK: - Injecting ViewModels -

extension Resolver {

    @MainActor
    private func injectViewModels() {
        container.register(HomeViewModel.self) { resolver in
            HomeViewModel(coordinator: resolver.resolve(HomeCoordinator.self)!, fetchStatementUseCase: resolver.resolve(FetchStatementUseCase.self)!)
        }
    }
}
