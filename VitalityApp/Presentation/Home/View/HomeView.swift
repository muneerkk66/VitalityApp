import SwiftUI
import RealmSwift
import Combine

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel = Resolver.shared.resolve(HomeViewModel.self)
    var body: some View {
        Text("Hello World").onAppear {
            viewModel.fetchStatement()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
