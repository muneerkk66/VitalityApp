//
//  HomeViewModel.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Foundation

import Combine
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    private let coordinator: HomeCoordinatorProtocol
    private let fetchStatementUseCase: FetchStatementUseCase
    private var disposables = Set<AnyCancellable>()

    init(coordinator: HomeCoordinatorProtocol, fetchStatementUseCase: FetchStatementUseCase) {
        self.coordinator = coordinator
        self.fetchStatementUseCase = fetchStatementUseCase
    }

    func fetchStatement() {
        fetchStatementUseCase
            .execute()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .failure(let error):

                    break
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] results in
                guard let self = self else { return }

                print(results)

            })
            .store(in: &disposables)
    }
}
