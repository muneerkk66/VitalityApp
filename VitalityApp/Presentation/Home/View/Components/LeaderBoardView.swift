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
                ForEach(statement?.leaderboard ?? [], id: \.leaderId) { leader in
                    LeaderView(leader: leader, currentUserId: statement?.userCard.userId)
                }
            }
        }
    }
}

#Preview {
    LeaderBoardView(statement: PreviewData.statement)
}
