//
//  LeaderBoardView.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import SwiftUI

struct LeaderBoardView: View {
    var statement: Statement?
    let onTapLeader: (String) -> Void

    var body: some View {
        List {
            Section(header: Text(Strings.LeaderBoard.title)) {
                ForEach(statement?.leaderboard ?? [], id: \.leaderId) { leader in
                    LeaderView(leader: leader, currentUserId: statement?.userCard.userId)
                        .onTapGesture {
                            onTapLeader(leader.name)
                        }
                }
            }

        }
    }
}

#Preview {
    LeaderBoardView(statement: PreviewData.statement, onTapLeader: {_ in })
}
