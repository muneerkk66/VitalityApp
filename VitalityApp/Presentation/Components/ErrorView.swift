//
//  ErrorView.swift
//  VitalityApp
//
//  Created by Muneer K K on 09/03/2024.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    let retryAction: () -> Void

    var body: some View {
        VStack {
            Text(errorMessage)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: retryAction) {
                Text(Strings.ErrorView.erroViewTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(Dimensions.space8)
            }
        }
        .padding()
    }
}

#Preview {
    ErrorView(errorMessage: "") {}
}
