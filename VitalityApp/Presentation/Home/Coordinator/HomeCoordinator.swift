//
//  HomeCoordinator.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Foundation

import Combine

final class HomeCoordinator: Coordinator {

    enum Screen: Routable {
        case details
    }
    @Published var navigationPath = [Screen]()

}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showDetailView() {
        navigationPath.append(.details)
    }
}
