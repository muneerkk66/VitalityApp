//
//  AppEnvironemnt.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

// This class facilitates the management of API endpoints and their associated keys. For enhanced security, Arakana encryption is utilized for handling API keys.
// Store your keys and secrets away from your source code ,use Arkana keys : https://github.com/rogerluan/arkana

import Foundation
enum AppEnvironment: String, Codable, CaseIterable {
    case development = "dev"
    case qa
    case production = "prod"
}

// Update environment variables based on the json file.
extension AppEnvironment {
    var jsonFile: String {
        switch self {
        case .development, .production, .qa:
            // For all environments, use the same mockPointsStatement JSON file. this will update based on the actual API end point
            return "mockPointsStatement"
        }
    }
}
