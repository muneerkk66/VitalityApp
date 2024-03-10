//
//  StatementView.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import SwiftUI

struct StatementView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        GeometryReader { proxy in
            ScrollView {

                Spacer(minLength: Dimensions.space80)

                LazyVStack(alignment: .leading) {

                    Text((viewModel.statement?.userCard.getCardTitle()).orEmpty)
                        .font(.system(size: Styles.fontSize.textLarge))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.horizontal, Dimensions.space20)

                    CardView(card: viewModel.statement?.userCard).listStyle(.plain)

                    Spacer(minLength: Dimensions.space20)

                    LeaderBoardView(statement: viewModel.statement, onTapLeader: { leader in
                        viewModel.handle(.onTapLeader(leader))
                    })
                    .frame(width: proxy.size.width, height: proxy.size.height)
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color(UIColor.secondarySystemBackground))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    StatementView(viewModel: Resolver.shared.resolve(HomeViewModel.self))
}
