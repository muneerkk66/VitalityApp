//
//  User.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

struct User {
    let name: String
    let surname: String?
}

extension User {
    // The separate parts of a person's name, allowing locale-aware formatting.
    // https://developer.apple.com/documentation/foundation/personnamecomponents
    func fullName() -> String {
        let formatter = PersonNameComponentsFormatter()
        var components = PersonNameComponents()
        components.givenName = name
        components.familyName = surname

        return formatter.string(from: components)
    }
}
