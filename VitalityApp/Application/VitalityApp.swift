import SwiftUI

@main
struct VitalityOnboardingAssessmentApp: App {
    
    init() {
        AppDependencies.bind()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
