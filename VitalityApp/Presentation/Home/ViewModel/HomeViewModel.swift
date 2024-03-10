//
//  HomeViewModel.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Foundation

import Combine
import SwiftUI

final class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinatorProtocol
    private let fetchStatementUseCase: FetchStatementUseCase

    @Published var statement: Statement?
    @Published var viewState: HomeViewState = .idle
    private var disposables = Set<AnyCancellable>()

    init(coordinator: HomeCoordinatorProtocol, fetchStatementUseCase: FetchStatementUseCase) {
        self.coordinator = coordinator
        self.fetchStatementUseCase = fetchStatementUseCase
    }

    @MainActor
    func handle(_ event: HomeViewEvent) {
        switch event {
        case .loadStatement, .retryLoadStatement:
            fetchStatement()
        case .onTapLeader(let name):
            coordinator.showDetailView(name: name)
        }
    }

    func fetchStatement() {
        viewState = .isLoading
        fetchStatementUseCase
            .execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):
                    viewState = .error(error.localizedDescription)
                    break
                case .finished:
                    viewState = .finished
                    break
                }
            }, receiveValue: { [weak self] results in
                guard let self = self else { return }
                statement = results
            })
            .store(in: &disposables)
    }
}
