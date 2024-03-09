//
//  HomeCoordinatorView.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import SwiftUI
import Combine

struct HomeCoordinatorView: View {
    @ObservedObject private var coordinator: HomeCoordinator = Resolver.shared.resolve(HomeCoordinator.self)

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            HomeView()
                .navigationDestination(for: HomeCoordinator.Screen.self) {
                    destination($0)
                }
        }
    }

    @ViewBuilder
    private func destination(_ screen: HomeCoordinator.Screen) -> some View {
        switch screen {
        case .details:
            DetailView()
        }
    }
}
