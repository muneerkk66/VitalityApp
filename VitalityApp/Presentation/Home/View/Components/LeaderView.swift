//
//  LeaderView.swift
//  VitalityApp
//
//  Created by Muneer K K on 10/03/2024.
//

import SwiftUI

struct LeaderView: View {
    let leader: LeaderBoard
    let userId: Int?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(leader.getLeaderTitle(leaderId: userId)).bold()
                Text(leader.getPointTitle())
            }
            Spacer()
            Text((leader.rank.ordinal).orEmpty).foregroundStyle(.secondary)
                .font(.subheadline)
        }.padding(.horizontal, Dimensions.space4)
    }
}

#Preview {
    LeaderView(leader: MockData.leaderBoard, userId: 123)
}
