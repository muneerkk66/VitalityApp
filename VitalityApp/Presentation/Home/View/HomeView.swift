import SwiftUI
import RealmSwift
import Combine

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = Resolver.shared.resolve(HomeViewModel.self)

    var body: some View {
        sceneView.onAppear {
            viewModel.handle(.loadStatement)
        }
    }
    // TODO: Based on the actual API integration, this feature should be updated to include a loader view.
    @ViewBuilder
    private var sceneView: some View {
        switch viewModel.viewState {
        case .idle, .finished, .isLoading:
            StatementView(viewModel: viewModel)
        case .error(let error):
            ErrorView(errorMessage: error) {
                viewModel.handle(.retryLoadStatement)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
