//
//  MockStatementLocalData.swift
//  VitalityAppTests
//
//  Created by Muneer K K on 10/03/2024.
//

import Foundation
@testable import VitalityApp

struct MockStatementLocalDataSource: StatementLocalDataSource {

    func fetchStatement() async -> StatementModel? {
        return nil
    }

    func saveStatement(_ object: StatementModel) async {

    }
}
