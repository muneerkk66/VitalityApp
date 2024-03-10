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

private var numberFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    return numberFormatter
}()

// MARK: this is based on the Localisable strings dict plural
private var pointFormatterString: String = {
    let formatString: String = NSLocalizedString("statement points",
                                                 comment: "statement points count string format to be found in Localizable.stringsdict")
    return formatString
}()

extension Int {
    /// Returns the ordinal representation of the integer.
    var ordinal: String? {
        return ordinalFormatter.string(from: NSNumber(value: self))
    }
    /// Returns the string representation of the integer with delimiters.
    var delimiter: String? {
        return numberFormatter.string(from: NSNumber(value: self))
    }
    /// Returns the localised string representation of the integer using a localised format string.
    var points: String? {
        return String.localizedStringWithFormat(pointFormatterString, self)
    }

}
