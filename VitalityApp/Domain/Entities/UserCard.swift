//
//  UserCard.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import Foundation

struct UserCard: Equatable {
    let userId: Int
    let fullName: String
    let totalPoints: Int
    let rank: Int
    var status: String
}

extension UserCard {
    func getCardTitle() -> String {
        return String(describing: "\(Strings.CardView.titleGreetings), \(fullName)")
    }
    func vitalityStatus() -> String {
        return String(describing: "\(status) \(Strings.CardView.statusPostFix)")
    }
}
