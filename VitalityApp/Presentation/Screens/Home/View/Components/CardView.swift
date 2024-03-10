//
//  CardView.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import SwiftUI

struct CardView: View {
    let card: UserCard?

    var body: some View {
        VStack(alignment: .leading) {
            header
            Spacer()
            footer
        }
        .frame(height: Dimensions.cardViewHight)
        .foregroundColor(.white)
        .padding(Dimensions.space12)
        .background(
            Color(.lightRed)
                .overlay(
                    RoundedRectangle(cornerRadius: Dimensions.space16)
                        .stroke(Color.secondary.opacity(0.5), lineWidth: 1.5)
                )
        )
        .cornerRadius(Dimensions.space16)
        .shadow(color: .gray, radius: Dimensions.space4, x: 0, y: Dimensions.space2)
        .padding(.horizontal, Dimensions.space20)
    }

    @ViewBuilder
    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(String(card?.totalPoints ?? 0))
                    .font(.title)
                    .fontWeight(.bold)

                Text(Strings.CardView.totalPoints.uppercased())
                    .font(.headline)
                    .fontWeight(.medium)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text((card?.rank.ordinal).orEmpty)
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }

    @ViewBuilder
    private var footer: some View {
        HStack(alignment: .bottom, spacing: Dimensions.space8) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(height: Dimensions.space80)
                .clipped()
            Spacer()
            Text((card?.vitalityStatus()).orEmpty)
                .font(.subheadline)
                .fontWeight(.medium)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: PreviewData.userCard)
    }
}
