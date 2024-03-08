import Foundation
import Swinject

// Resolver is a singleton class that is responsible for injecting all dependencies in the app.
class Resolver {

	static let shared = Resolver()

	private var container = Container()

	// This method is responsible for injecting all dependencies in the app.
	@MainActor func injectModules() {
	}

	/// - Parameter type: The type of the dependency to be resolved.
	/// - Returns: The resolved dependency.
	func resolve<T>(_ type: T.Type) -> T {
		container.resolve(T.self)!
	}
}

