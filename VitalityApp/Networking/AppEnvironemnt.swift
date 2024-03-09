//
//  AppEnvironemnt.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

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
            return "mockPointsStatement"
        }
    }
}
