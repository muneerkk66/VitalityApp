//
//  AppCoordinatorView.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import SwiftUI
struct AppCoordinatorView: View {

    @ObservedObject private var coordinator: AppCoordinator = Resolver.shared.resolve(AppCoordinator.self)

    var body: some View {
        sceneView
            .onAppear {
                coordinator.handle(.showMain)
            }
    }

    @ViewBuilder
    private var sceneView: some View {
        switch coordinator.state {
        case .idle:
            EmptyView()

        case .main:
            HomeCoordinatorView()
        }
    }
}
