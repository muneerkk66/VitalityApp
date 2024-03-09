//
//  StatementDataSource.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

final class StatementLocalDataSource {

    private let realmProvider = RealmProvider()

    func fetchStatement() async -> UserInfoModel? {
        guard let storage = await realmProvider.realm() else { return nil }
        return storage.objects(UserInfoModel.self).first
    }

    func saveStatement(_ profileObject: UserInfoModel) async {
        guard let storage = await realmProvider.realm() else { return }
        storage.writeAsync {
            storage.add(profileObject, update: .all)
        }
    }
}
