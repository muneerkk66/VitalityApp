import SwiftUI

@main
struct VitalityOnboardingAssessmentApp: App {

    init() {
        // Injecting all dependencies
        Resolver.shared.injectModules()
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
        }
    }
}
