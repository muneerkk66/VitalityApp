//
//  APIError.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation
// This encompasses both common errors and server-specific errors when transitioning from JSON to an API.

enum APIError: LocalizedError {
    case connectionError
    case serverError(Error)
    case applicationError
    case fileNotFound

    var message: String {
        switch self {
        case .connectionError:
            return "Connection error"
        case .fileNotFound:
            return "File not found"
        case .serverError, .applicationError:
            return "Something went wrong"
        }
    }
}

extension Error {
    var applicationError: APIError {
        if let error = self as? URLError {
            return error.code == .notConnectedToInternet
                ? .connectionError
                : .serverError(error)
        } else {
            return .applicationError
        }
    }
}
