//
//  StatementDataSource.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
protocol StatementLocalDataSource {
    func fetchStatement() async -> StatementModel?
    func saveStatement(_ object: StatementModel) async
}

final class StatementLocalDataSourceLive: StatementLocalDataSource {

    private let realmProvider: RealmProvider

    init(realmProvider: RealmProvider) {
        self.realmProvider = realmProvider
    }

    @BackgroundActor
    func fetchStatement() async -> StatementModel? {
        guard let storage = await realmProvider.realm() else { return nil }
        return storage.objects(StatementModel.self).first
    }

    @BackgroundActor
    func saveStatement(_ object: StatementModel) async {
        guard let storage = await realmProvider.realm() else { return }
        storage.writeAsync {
            storage.add(object, update: .all)
        }
    }
}
