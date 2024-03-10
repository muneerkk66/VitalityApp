//
//  String+Extension.swift
//  VitalityApp
//
//  Created by Muneer K K on 10/03/2024.
//

import Foundation

extension Optional where Wrapped: StringProtocol {
    var orEmpty: String {
        switch self {
        case .some(let value):
            return String(value)
        case .none:
            return ""
        }
    }
}
