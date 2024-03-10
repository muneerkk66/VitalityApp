//
//  LeaderView.swift
//  VitalityApp
//
//  Created by Muneer K K on 10/03/2024.
//

import SwiftUI

struct LeaderView: View {
    let leader: Leader
    let currentUserId: Int?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(leader.getLeaderTitle(userId: currentUserId)).bold()
                Text(leader.getPointTitle())
            }
            Spacer()
            Text((leader.rank.ordinal).orEmpty).foregroundStyle(.secondary)
                .font(.subheadline)
        }.padding(.horizontal, Dimensions.space4)
    }
}

#Preview {
    LeaderView(leader: PreviewData.leader, currentUserId: PreviewData.leader.leaderId)
}
