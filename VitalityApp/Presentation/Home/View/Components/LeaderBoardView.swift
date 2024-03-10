//
//  LeaderBoardView.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import SwiftUI

struct LeaderBoardView: View {
    var statement: Statement?

    var body: some View {
        List {
            Section(header: Text(Strings.LeaderBoard.title)) {
                ForEach(statement?.leaderBoard ?? [], id: \.userId) { leader in
                    LeaderView(leader: leader, userId: statement?.card.userId)
                }
            }
        }
    }
}

#Preview {
    LeaderBoardView(statement: Statement(card: MockData.userCard, leaderBoard: [MockData.leaderBoard]))
}
