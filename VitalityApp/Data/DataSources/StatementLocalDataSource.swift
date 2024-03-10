//
//  StatementDataSource.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

final class StatementLocalDataSource {

    private let realmProvider = RealmProvider()

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
