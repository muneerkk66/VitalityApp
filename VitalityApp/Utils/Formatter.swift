//
//  Formatter.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

private var ordinalFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter
}()

extension Int {
    var ordinal: String? {
        return ordinalFormatter.string(from: NSNumber(value: self))
    }
}
