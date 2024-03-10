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
		VStack(alignment: .leading,spacing: 16){
			HStack(alignment:.top){
				VStack(alignment: .leading){
					Text(String(card?.totalPoints ?? 0))
						.font(.title)
						.fontWeight(.bold)

					Text("TOTAL POINTS")
						.font(.headline)
						.fontWeight(.regular)
				}
				Spacer()
				VStack(alignment:.trailing){
					Text(card?.rankValue ?? "")
						.font(.headline)
						.fontWeight(.bold)

				}
			}

			Spacer()

			HStack(alignment:.bottom,spacing: 8){
				VStack(alignment: .leading){
					Image(.logo)
						.resizable()
						.scaledToFit()
						.frame(height: 80)
						.clipped()
				}
				Spacer()
				VStack(alignment: .leading){
					Text(card?.status ?? "")
						.font(.headline)
						.fontWeight(.regular)
				}
			}
		}
		.frame(height:200)
		.foregroundColor(.white)
		.padding(12)
		.background(
			Color(.lightRed)
				.overlay(
					RoundedRectangle(cornerRadius: 16)
						.stroke(Color.secondary.opacity(0.5),lineWidth: 1.5)
				)
		)

		.cornerRadius(16)
		.shadow(color: .gray, radius: 5, x: 0, y: 2) // Add shadow here
		.padding(.horizontal)
		.padding(.top,8)
	}
}


#Preview {
	CardView(card:MockData.userCard)
}
