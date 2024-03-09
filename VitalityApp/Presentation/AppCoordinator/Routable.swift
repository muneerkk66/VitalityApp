//
//  Routable.swift
//  VitalityApp
//
//  Created by Muneer K K on 08/03/2024.
//

import Foundation

protocol Routable: Hashable, Identifiable {}

extension Routable {
    var id: String {
        String(describing: self)
    }
}
